class SpacesController < ApplicationController
  # before_action :authenticate_user!
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
  end

  def create
    # create Space from params
  end

  def update
    # update some Space's params
  end

  def destroy
    # destroy some Space
  end
end
