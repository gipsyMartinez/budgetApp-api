class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:update, :show, :destroy]

  def index
    @items = Item.all
    render json: @items
  end

  def show
    render json: @item
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render status: :created, json: { message: "Item created!", id: @item.id }
    else
      render status: :unprocessable_entity, json: { message: @item.errors.full_messages }
    end
  end

  def update
    if @item.update(item_params)
      render status: :ok, json: { message: "Item successfully updated" }
    else
      render status: :unprocessable_entity, json: { message: @item.errors.full_messages }
    end
  end

  def destroy
    if @item.destroy
      render status: :ok, json: { message: "Item successfully deleted" }
    else
      render status: :unprocessable_entity, json: { message: @item.errors.full_messages }
    end
  end

  private
    def item_params
      params.require(:item).permit(:budget_id, :description, :amount)
    end

    def set_item
      @item = Item.find(params[:id])
    end
end
