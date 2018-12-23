# == Schema Information
#
# Table name: rulesets
#
#  id          :bigint(8)        not null, primary key
#  space_id    :bigint(8)        not null
#  name        :text             not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Ruleset < ApplicationRecord
  belongs_to :space

  has_many :rules, dependent: :destroy

  validates :space, presence: true
  validates :name, presence: true
end
