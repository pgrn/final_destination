# == Schema Information
#
# Table name: calendar_entry_participations
#
#  id                :bigint(8)        not null, primary key
#  user_id           :bigint(8)        not null
#  calendar_entry_id :bigint(8)        not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class CalendarEntryParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :calendar_entry

  validates :user, presence: true
  validates :calendar_entry, presence: true
end
