class RentedItemsController < ApplicationController
  before_action :set_rented_item, only: %i[ show edit update destroy ]

  # GET /rented_items or /rented_items.json
  def index
    @rented_items = RentedItem.all
  end

  # GET /rented_items/1 or /rented_items/1.json
  def show
  end

  # GET /rented_items/new
  def new
    @rented_item = RentedItem.new
  end

  # GET /rented_items/1/edit
  def edit
  end

  # POST /rented_items or /rented_items.json
  def create
    @rented_item = RentedItem.new(rented_item_params)

    respond_to do |format|
      if @rented_item.save
        format.html { redirect_to @rented_item, notice: "Rented item was successfully created." }
        format.json { render :show, status: :created, location: @rented_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rented_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rented_items/1 or /rented_items/1.json
  def update
    respond_to do |format|
      if @rented_item.update(rented_item_params)
        format.html { redirect_to @rented_item, notice: "Rented item was successfully updated." }
        format.json { render :show, status: :ok, location: @rented_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rented_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rented_items/1 or /rented_items/1.json
  def destroy
    @rented_item.destroy
    respond_to do |format|
      format.html { redirect_to rented_items_url, notice: "Rented item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rented_item
      @rented_item = RentedItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rented_item_params
      params.fetch(:rented_item, {})
    end
end
