class ParticipationsController < ApplicationController
  before_action :set_participation, only: %i[ show edit update destroy ]
  before_action :check_admin, except: %i[ show index ]
  before_action :login_required, only: %i[ create, new ]

  # GET /participations
  def index
    @participations = Participation.all
  end

  # GET /participations/1
  def show
  end

  # GET /posts/:post_id/register
  def new
    post = Post.find(params[:post_id])
    if post.event&.event_type.nil?
      redirect_to root_url, notice: "Ehhez az eseményhez nincs jelentkeztető űrlap"
    else
      @JSON          = post.event.event_type.json_form_data
      @participation = Participation.new(event: post.event)
    end
  end

  # GET /participations/1/edit
  def edit
  end

  # POST /participations
  def create
    @participation = Participation.new(participation_params)
    @participation.user = current_user
    if @participation.save
      redirect_to @participation, notice: "Participation was successfully created."
    else
      redirect_to @participation.event.post, notice: 'Invalid data'
    end
  end

  # PATCH/PUT /participations/1
  def update
    if @participation.update(participation_params)
      redirect_to @participation, notice: "Participation was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /participations/1
  def destroy
    @participation.destroy
    redirect_to participations_url, notice: "Participation was successfully destroyed."
  end

  private


  # Use callbacks to share common setup or constraints between actions.
  def set_participation
    @participation = Participation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def participation_params
    params.require(:participation).permit(:user_id, :event_id, form_answers: {})
  end
end
