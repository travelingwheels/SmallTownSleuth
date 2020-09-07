class TownsController < ApplicationController
  before_action :set_town, only: [:show]

  def new
    @town = Town.new
  end

  def create
    @town = current_user.towns.build(town_params)
    if @town.save
      redirect_to town_path(@town)
    else
      render :new
    end
  end

  def index
    @towns = Town.order_by_state
  end

  def show
  end

  private

  def town_params
    params.require(:town).permit(:name, :state, :amenities)
  end

  def set_town
    @town = Town.find_by_id(params[:id])
  end
end
