class RentsController < ApplicationController
  before_action :set_rent, only: %i[show edit update destroy]
  before_action :login_required
  before_action :check_admin, except: %i[show new create]

  # GET /rents
  def index
    @rents = Rent.not_closed
  end

  # Get /rents/closed
  def closed
    @rents = Rent.closed
  end

  # GET /rents/1
  def show; end

  # GET /rents/new
  def new
    @rent = Rent.new
  end

  # GET /rents/1/edit
  def edit; end

  # POST /rents
  def create
    @rent        = Rent.new(rent_params)
    @rent.user   = current_user
    @rent.status = :pending unless current_user.admin?

    if @rent.save
      redirect_to @rent, notice: 'Rent was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rents/1
  def update
    if @rent.update(rent_params)
      redirect_to @rent, notice: 'Rent was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /rents/1
  def destroy
    @rent.destroy
    redirect_to rents_url, notice: 'Rent was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rent
    @rent = Rent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rent_params
    params.require(:rent).permit(:start_date, :end_date, :order, :comment, :status)
  end
end
