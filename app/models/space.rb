# == Schema Information
#
# Table name: spaces
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text
#  location    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Space < ApplicationRecord
  extend FriendlyId
  friendly_id :short_name, use: :slugged, slug_column: :short_name

  validates :name, presence: true
  validates :short_name, presence: true, uniqueness: true

  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  has_many :calendars, dependent: :destroy

  has_many :rulesets, dependent: :destroy
  has_many :rules, through: :rulesets

  has_many :washing_machine_programs, dependent: :destroy

  has_many :kudos, dependent: :destroy

  has_many :saved_places, dependent: :destroy
end
