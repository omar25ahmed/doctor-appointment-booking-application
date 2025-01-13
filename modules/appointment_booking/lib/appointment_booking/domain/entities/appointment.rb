module AppointmentBooking
  module Domain
    module Entities
      class Appointment
        attr_reader :id, :slot_id, :patient_id, :patient_name, :reserved_at

        def initialize(id:, slot_id:, patient_id:, patient_name:, reserved_at:)
          @id = id
          @slot_id = slot_id
          @patient_id = patient_id
          @patient_name = patient_name
          @reserved_at = reserved_at
        end
      end
    end
  end
end
