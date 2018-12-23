# == Schema Information
#
# Table name: washing_machine_programs
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  space_id    :bigint(8)
#  temp        :integer          not null
#  temp_unit   :string           not null
#  speed       :integer          not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class WashingMachineProgram < ApplicationRecord
  belongs_to :space
end
