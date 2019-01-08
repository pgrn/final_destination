class CalendarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_space

  def index
    # show all calendars
    @events = unless params[:space] and !params[:space][:calendar_ids].empty?
      @space.calendar_entries
    else
      CalendarEntriesFromCalsQuery.new(@space.calendars).by_calendar_ids(params[:space][:calendar_ids])
    end
    
  end

  private

  def set_space
    @space = Space.friendly.find(params[:space_id]) if Space.friendly.exists?(params[:space_id])
  end

end
