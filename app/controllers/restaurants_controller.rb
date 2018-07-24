class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    # save the restaurant
    restaurant.save
    # redirect to show
    redirect_to restaurant_path(restaurant)
  end

  def edit
  end

  def update
    # save the restaurant
    @restaurant.update(restaurant_params)

    # redirect to show
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    # redirect to index
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end



end
