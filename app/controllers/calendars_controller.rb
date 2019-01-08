class CalendarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_space

  def index
    # show all calendars
    @events = unless (params.has_key?(:space) ? params[:space].has_key?(:calendar_ids) : false)
      @space.calendar_entries
    else
      @currently_selected = params[:space][:calendar_ids]
      CalendarEntriesFromCalsQuery.new(@space.calendars).by_calendar_ids(params[:space][:calendar_ids])
    end
    
  end

  private

  def set_space
    @space = Space.friendly.find(params[:space_id]) if Space.friendly.exists?(params[:space_id])
  end

end
