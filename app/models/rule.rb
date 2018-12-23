# == Schema Information
#
# Table name: rules
#
#  id          :bigint(8)        not null, primary key
#  name        :text             not null
#  description :text
#  ruleset_id  :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Rule < ApplicationRecord
  belongs_to :ruleset

  validates :name, presence: true
end
