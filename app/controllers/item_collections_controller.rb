class ItemCollectionsController < ApplicationController
  before_action :set_item_collection, only: [:show, :edit, :update, :destroy]

  # GET /item_collections
  # GET /item_collections.json
  def index
    @item_collections = ItemCollection.all
  end

  # GET /item_collections/1
  # GET /item_collections/1.json
  def show
    if params["sort"].present?
      @items = @item_collection.items.order(:title)
    else
      @items = @item_collection.items
    end
  end

  # GET /item_collections/new
  def new
    @item_collection = ItemCollection.new
  end

  # GET /item_collections/1/edit
  def edit
  end

  # POST /item_collections
  # POST /item_collections.json
  def create
    @item_collection = ItemCollection.new(item_collection_params)

    respond_to do |format|
      if @item_collection.save
        format.html { redirect_to @item_collection, notice: 'Item collection was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item_collection }
      else
        format.html { render action: 'new' }
        format.json { render json: @item_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_collections/1
  # PATCH/PUT /item_collections/1.json
  def update
    respond_to do |format|
      if @item_collection.update(item_collection_params)
        format.html { redirect_to @item_collection, notice: 'Item collection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_collections/1
  # DELETE /item_collections/1.json
  def destroy
    @item_collection.destroy
    respond_to do |format|
      format.html { redirect_to item_collections_url }
      format.json { head :no_content }
    end
  end

  def add_item
    @item = Item.new
  end

  def add_item_from_lib
    @items = Item.all
  end

  def create_item
    @item_collection = ItemCollection.find(params["id"])
    if params[:item_ids].present?
      p params[:item_ids]
      params[:item_ids].each do |item|
        @item_collection.items << Item.find(item) unless @item_collection.items.include? Item.find(item)
      end
    else
      @item = @item_collection.items.create(item_params)
    end
    redirect_to "/item_collections/#{@item_collection.id}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_collection
      @item_collection = ItemCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_collection_params
      params.require(:item_collection).permit(:title, :description)
    end

    def item_params
      params.require(:item).permit(:title)
    end
end
