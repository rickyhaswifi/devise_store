class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
      @shops = Shop.all
    end

  def show
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to @shop
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @shop.update(shop_params)
      redirect_to @shop
    else
      render :new
    end
  end

  def destroy
    @shop.destroy
    redirect_to root_path
  end

  def copy
    @cart = Shop.find(params[:id])
    @shop = @cart.dup
    render './carts/new'
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :price)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end
