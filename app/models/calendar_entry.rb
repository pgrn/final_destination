# == Schema Information
#
# Table name: calendar_entries
#
#  id                     :bigint(8)        not null, primary key
#  name                   :text             not null
#  description            :text
#  location               :text
#  time                   :datetime         not null
#  calendar_id            :bigint(8)        not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  custom_entry_type      :string
#  calendar_entry_type_id :bigint(8)        not null
#

class CalendarEntry < ApplicationRecord
  include Squint
  
  belongs_to :calendar

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id, optional: true
  
  belongs_to :calendar_entry_type
  
  validates :calendar, presence: true
  validates :time, presence: true
  validates :calendar_entry_type, presence: true
end
