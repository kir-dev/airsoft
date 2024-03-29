class EventTypesController < ApplicationController
  before_action :set_event_type, only: %i[show edit update destroy copy]
  before_action :check_admin

  # GET /event_types
  def index
    @event_types = EventType.all
  end

  # GET /event_types/1
  def show; end

  # GET /event_types/new
  def new
    @event_type = EventType.new
  end

  # GET /event_types/1/edit
  def edit; end

  # POST /event_types
  def create
    @event_type = EventType.new(event_type_params)
    if @event_type.save
      redirect_to @event_type, notice: 'Event type was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_types/1
  def update
    if @event_type.update(event_type_params)
      redirect_to @event_type, notice: 'Event type was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /event_types/1
  def destroy
    @event_type.destroy
    redirect_to event_types_url, notice: 'Event type was successfully destroyed.'
  end

  # POST /event_types/1/copy
  def copy
    event_type_copy = @event_type.dup
    event_type_copy.name += ' másolata'
    event_type_copy.save
    redirect_to edit_event_type_url(event_type_copy), notice: 'Űrlap sikeresen másolva!'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event_type
    @event_type = EventType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_type_params
    params.require(:event_type).permit(:name, :schema, :uischema)
  end
end
