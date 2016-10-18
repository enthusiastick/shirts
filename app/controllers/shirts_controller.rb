class ShirtsController < ApplicationController

  before_action :authenticate_user!

  def create
    @shirt = Shirt.new(shirt_params)
    @shirt.user = current_user
    if @shirt.save
      flash[:success] = "Shirt created."
      redirect_to @shirt
    else
      flash[:alert] = "There was a problem creating this shirt."
      render :new
    end
  end

  def destroy
    @shirt = Shirt.find(params[:id])
    authorize_object_owner(@shirt)
    if @shirt.destroy
      flash[:success] = "Shirt deleted."
      redirect_to shirts_path
    else
      flash[:alert] = "There was a problem deleting this shirt."
      render :show
    end
  end

  def edit
    @shirt = Shirt.find(params[:id])
    authorize_object_owner(@shirt)
  end

  def index
    @shirts = current_user.shirts.order(:name)
  end

  def new
    @shirt = Shirt.new
  end

  def show
    @shirt = Shirt.find(params[:id])
    authorize_object_owner(@shirt)
  end

  def update
    @shirt = Shirt.find(params[:id])
    authorize_object_owner(@shirt)
    if @shirt.update(shirt_params)
      flash[:success] = "Shirt updated."
      redirect_to @shirt
    else
      flash[:alert] = "There was a problem updating this shirt."
      render :edit
    end
  end

  protected

  def shirt_params
    params.require(:shirt).permit(:description, :name, :picture)
  end

end
