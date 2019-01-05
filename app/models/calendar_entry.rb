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

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id, optional: true
  
  validates :calendar, presence: true
  validates :time, presence: true
end
