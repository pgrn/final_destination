# == Schema Information
#
# Table name: calendars
#
#  id            :bigint(8)        not null, primary key
#  name          :string           not null
#  description   :text
#  location      :text
#  calendar_type :string           not null
#  space_id      :bigint(8)        not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Calendar < ApplicationRecord
  belongs_to :space
  validates :space, presence: true

  has_many :calendar_entries, dependent: :destroy
end
