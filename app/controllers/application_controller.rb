class ApplicationController < ActionController::Base
  # TODO find a better place for this
  def set_space
    @space = if Space.friendly.exists?(params[:space_id])
      Space.friendly.find(params[:space_id]) 
    else
      render file: "#{Rails.root}/public/404", status: :not_found
    end
  end
end
