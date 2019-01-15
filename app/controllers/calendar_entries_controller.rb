class CalendarEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_space, only: [:new, :create, :edit, :update]

  def new
    @new_ce = CalendarEntry.new
  end

  def create
    @new_ce = CalendarEntry.new(new_calendar_entry_params.merge({ owner: current_user }))

    if @new_ce.save
      # TODO
      flash[:success] = "Successfully updated!"
    else
      # TODO
    end
    
  end

  def edit
    # TODO: auth (so that only the event's owner can update)
    @ce = CalendarEntry.find(params[:id])
  end

  def update
    # TODO: auth (so that only the event's owner can update)
    @ce = CalendarEntry.find(params[:id])

    if @ce.update(new_calendar_entry_params)
      # TODO
      flash[:success] = "Successfully updated!"
    else
      # TODO
    end
  end

  private

  def new_calendar_entry_params
    prm = params.require(:calendar_entry).permit(
      :name, :description, :location, :all_day, :owner_id, :calendar_id
    )
    st = datetime_from_params(params.require(:calendar_entry).permit(:start_time), "start_time")
    et = datetime_from_params(params.require(:calendar_entry).permit(:end_time), "end_time")
    prm.merge({ start_time: st, end_time: et })
  end

  def datetime_from_params(params, date_key)
    date_keys = params.keys.select { |k| k.to_s.match?(date_key.to_s) }.sort
    date_array = params.values_at(*date_keys).map(&:to_i)
    DateTime.civil(*date_array)
  end
end
