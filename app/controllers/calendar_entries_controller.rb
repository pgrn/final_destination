class CalendarEntriesController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!
  before_action :set_space, only: [:new, :create, :edit, :update]

  def new
    @new_ce = CalendarEntry.new
    @new_ce.entry_data = { foo: "" }
  end

  def create
    @new_ce = CalendarEntry.new(new_calendar_entry_params.merge({ owner: current_user }))
    @new_ce.entry_data = case entry_data_selector_params[:type]
    when "washing machine sharing"
      { type: "wms", payload: params[:calendar_entry][:entry_data_wms] }
    else
      { type: "none", payload: {} }
    end

    respond_to do |format|
      if @new_ce.save
        format.json { render json: @new_ce, status: :created, location: space_calendars_path }
      else
        format.json { render json: @new_ce.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
    # TODO: auth (so that only the event's owner can update)
    @ce = CalendarEntry.find(params[:id])
  end

  def update
    # TODO: auth (so that only the event's owner can update)
    @ce = CalendarEntry.find(params[:id])

    respond_to do |format|
      if @ce.update(new_calendar_entry_params)
        format.json { render json: @ce, status: :ok, location: space_calendars_path }
      else
        format.json { render json: @ce.errors, status: :unprocessable_entity }
      end
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

  def entry_data_selector_params
    params.require(:entry_data_selector).permit(:type)
  end

  def entry_data_params
    params.require(:calendar_entry).permit(:entry_data)
  end
end
