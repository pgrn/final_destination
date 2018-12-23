# == Schema Information
#
# Table name: calendar_wms_entries
#
#  id                         :bigint(8)        not null, primary key
#  calendar_entry_id          :bigint(8)        not null
#  washing_machine_program_id :bigint(8)        not null
#  fullness                   :integer          not null
#  content                    :string           not null
#  extra_info                 :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class CalendarWmsEntry < ApplicationRecord
  belongs_to :calendar_entry
  belongs_to :washing_machine_program
end
