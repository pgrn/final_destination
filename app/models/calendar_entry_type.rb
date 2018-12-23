# == Schema Information
#
# Table name: calendar_entry_types
#
#  id         :bigint(8)        not null, primary key
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CalendarEntryType < ApplicationRecord
  has_many :calendar_entries
end
