class CalendarEntryPayloadValidator < ActiveModel::Validator
  def validate(ce)
    payload = ce.entry_data["payload"]
    ce_type = ce.entry_data["type"]

    # if payload is nil that means no params have been provided
    # probably disabled fields at the frontend
    if payload.nil?
      ce.errors.add(:entry_data_payload, "can't be nil for non-standard event")
      return
    end

    case ce_type
    when "wms"
      ["washing_machine_program_id", "clothes_type", "wm_percent_full"].each do |k|
        unless payload.has_key?(k.to_sym)
          ce.errors.add(:entry_data_payload, "doesn't have a required key: #{k}") 
        end

        if payload["washing_machine_program_id"]
          wmp = WashingMachineProgram.find_by(id: payload["washing_machine_program_id"])

          if wmp
            space = ce.calendar.space
            unless space.washing_machine_programs.include? wmp
              errors.add(:entry_data_payload_washing_machine_program_id, "this washing machine program doesn't belong to this space")
            end
          else
            errors.add(:entry_data_payload_washing_machine_program_id, "washing machine program doesn't exist")
          end
        end

        if payload["clothes_type"]
          # TODO validate clothes types
        end

        if payload["wm_percent_full"]
          unless (0..100).step(10).include? payload["wm_percent_full"].to_i
            ce.errors.add(:entry_data_payload_wm_percent_full, "incorrect value") 
          end
        end
      end
    else
    end
  end
end