# == Schema Information
#
# Table name: subscriptions
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)        not null
#  space_id   :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :space

  validates :user, presence: true
  validates :space, presence: true
end
