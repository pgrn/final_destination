# == Schema Information
#
# Table name: calendar_entries
#
#  id          :bigint(8)        not null, primary key
#  name        :text             not null
#  description :text
#  location    :text
#  time        :datetime         not null
#  owner_id    :bigint(8)
#  calendar_id :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  entry_data  :jsonb            not null
#

class CalendarEntry < ApplicationRecord
  include Squint
  
  belongs_to :calendar

  belongs_to :space

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id, optional: true
  
  validates :space, presence: true
  validates :calendar, presence: true       
  validates :all_day, inclusion: { in: [ true, false ] }
  validate :start_and_end_time_correctness

  def start_and_end_time_correctness
    if all_day == true
      unless start_time == end_time or end_time == nil
        errors.add(:end_time, "must either be nil or equal to start date if the event is all day long")
      end
    else
      if end_time == nil
        errors.add(:end_time, "cannot be nil if the event's not all day long")
      else
        if start_time > end_time
          errors.add(:start_time, "cannot be a date later than the event's end time")
        end
      end
    end
  end
end
