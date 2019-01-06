class SpacesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    if Space.friendly.exists?(params[:id])
      @space = Space.friendly.find(params[:id])
      render status: 402 unless current_user.is_member_of?(@space)
    else
      # TODO some redirects
      render file: "#{Rails.root}/public/404", status: :not_found
    end
  end

  def new
    # new Space form
    @space = Space.new
  end

  def create
    # create Space from params
    @space = Space.new(new_space_params)

    if @space.save
      flash[:success] = "Welcome to your new space, #{current_user.name}!"
      redirect_to @space
    else
      flash[:error] = "Something failed!"
      redirect_to new_space_path
    end
  end

  def edit
    # edit some Space's params
    # TODO authorization
    @space = Space.friendly.find(params[:id]) if Space.friendly.exists?(params[:id])
  end

  def update
    # actually update some Space's params
    # TODO authorization
    @space = Space.friendly.find(params[:id]) if Space.friendly.exists?(params[:id])

    if @space.update(new_space_params)
      flash[:success] = "Space successfully edited!"
      redirect_to @space
    else
      flash[:error] = "Something failed!"
      redirect_to edit_space_path
    end
  end

  def destroy
    # destroy some Space
    # TODO
    # TODO authorization
  end

  private

  def new_space_params
    params.require(:space).permit(:name, :description, :location, :short_name)
  end
end
