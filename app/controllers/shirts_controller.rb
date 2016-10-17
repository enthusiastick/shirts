class ShirtsController < ApplicationController

  def create
    @shirt = Shirt.new(shirt_params)
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
  end

  def index
    @shirts = Shirt.order(:name)
  end

  def new
    @shirt = Shirt.new
  end

  def show
    @shirt = Shirt.find(params[:id])
  end

  def update
    @shirt = Shirt.find(params[:id])
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
