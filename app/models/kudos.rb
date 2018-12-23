# == Schema Information
#
# Table name: kudos
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text
#  value       :integer          not null
#  kudoer_id   :bigint(8)        not null
#  kudoee_id   :bigint(8)        not null
#  space_id    :bigint(8)        not null
#  time        :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Kudos < ApplicationRecord
  belongs_to :space
  belongs_to :kudoer, class_name: 'User', foreign_key: 'kudoer_id'
  belongs_to :kudoee, class_name: 'User', foreign_key: 'kudoee_id'
end
