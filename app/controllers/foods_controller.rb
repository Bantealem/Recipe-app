  class FoodsController < ApplicationController
    before_action :authenticate_user!
  def index
    @foods = Food.all.where(user_id: current_user.id).order(created_at: :desc)
  end
  def def new
    @new_food = Food.new
  end
  
  
  def create
    @new_food = Food.new(user: current_user, name: params[:name], measurement_unit: params[:measurement_unit], price: params[:price])
    if @new_food.save
      flash.now[:notice] = "Successfully created food."
      redirect_to foods_path
    else
      flash.now[:alert] = "Error creating food."
      render :new
    end
  end

  def destroy
    @foods = Food.where(user_id: current_user.id).order(created_at: :desc)
    @food_delete = Food.find(params[:id])
    if @food_delete.destroy
      flash.now[:notice] = "Successfully deleted food."
      redirect_to foods_path
    else
      flash.now[:alert] = "Error deleting food."
      render :new
    end
  end

end
