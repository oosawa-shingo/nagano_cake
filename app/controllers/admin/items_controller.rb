class Admin::ItemsController < ApplicationController
  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if admin_signed_in?
      @items.save
      redirect_to admin_item_path(@items.id)
    else
      redirect_to new_admin_item_path
    end
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end
end
