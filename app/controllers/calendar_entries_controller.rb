class CalendarEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_space, only: [:new]

  def new
    @new_ce = CalendarEntry.new
  end

  def create
    @new_ce = CalendarEntry.new(new_calendar_entry_params)

    # TODO
  end

  private

  def new_calendar_entry_params
    params.require(:calendar_entry).permit(
      :name, :description, :location, :start_time, :end_time, :all_day, :owner_id, :calendar_id
    )
  end
end
