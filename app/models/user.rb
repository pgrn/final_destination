# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           not null
#  name                   :string
#  location               :text
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :name, presence: true

  has_many :subscriptions, dependent: :destroy
  has_many :spaces, through: :subscriptions

  has_many :calendar_entry_participations, dependent: :destroy
  has_many :calendar_entries, through: :calendar_entry_participations

  has_many :kudos_given, class_name: 'Kudos', foreign_key: :kudoer_id
  has_many :kudos_received, class_name: 'Kudos', foreign_key: :kudoee_id

end
