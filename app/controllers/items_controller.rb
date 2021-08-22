class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  before_action :check_admin, except: %i[index]
  before_action :set_description_post, only: %i[index]

  # GET /items
  def index
    @items = Item.all
  end

  # GET /items/1
  def show; end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit; end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :description)
  end

  def set_description_post
    @post = Post.unscoped.find_by! static_id: :rent
  rescue ActiveRecord::RecordNotFound
    @post = Post.create! static_id: :rent, title: 'Eszközbérlés oldal tartalma',
                         short_description: '[Nem szükséges kitölteni]'
    redirect_to edit_post_url(@post)
  end
end
