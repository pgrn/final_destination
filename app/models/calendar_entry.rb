# == Schema Information
#
# Table name: calendar_entries
#
#  id          :bigint(8)        not null, primary key
#  name        :text             not null
#  description :text
#  location    :text
#  start_time  :datetime         not null
#  owner_id    :bigint(8)
#  calendar_id :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  entry_data  :jsonb            not null
#  end_time    :datetime
#  all_day     :boolean          default(FALSE), not null
#

class CalendarEntry < ApplicationRecord
  include Squint
  
  belongs_to :calendar

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id, optional: true
  
  validates :name, presence: true
  validates :calendar, presence: true
  validates :all_day, inclusion: { in: [ true, false ] }
  validate :end_date_after_start_date?
  validates_with CalendarEntryPayloadValidator

  def end_date_after_start_date?
    errors.add(:end_time, "can't be before the start time") if end_time < start_time
  end
end
