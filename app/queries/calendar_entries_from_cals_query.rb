class CalendarEntriesFromCalsQuery
  attr_reader :calendars

  def initialize(calendars)
    @calendars = calendars
  end

  def by_calendar_ids(calendar_ids)
    @calendars
      .includes(:calendar_entries)
      .where(id: calendar_ids)
      .map(&:calendar_entries)
      .flatten
  end

  private

  def custom_sql
    # custom SQL query ...
  end
end