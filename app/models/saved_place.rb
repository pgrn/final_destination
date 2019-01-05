# == Schema Information
#
# Table name: saved_places
#
#  id          :bigint(8)        not null, primary key
#  name        :text             not null
#  description :text             not null
#  owner_id    :bigint(8)        not null
#  space_id    :bigint(8)        not null
#  address     :text
#  website     :text
#  phone       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SavedPlace < ApplicationRecord
  belongs_to :space
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :space, presence: true
  validates :owner, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
