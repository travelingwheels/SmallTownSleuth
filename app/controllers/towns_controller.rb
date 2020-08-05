class TownsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @town = Town.new
  end

  def create
    @town = current_user.towns.build(town_params)
    if @town.save
      redirect_to towns_path
    else
      render :new
    end
  end

  def index
    @towns = Town.all#.includes(:reviews)
  end

  def show
     @town = Town.find_by_id(params[:id])
  end

  private

  def town_params
    params.require(:town).permit(:name)
  end


end
