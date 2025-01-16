require 'securerandom'

module AppointmentBooking
  module UseCases
    class BookAppointment
      def initialize(appointment_repository)
        @appointment_repository = appointment_repository
      end

      def execute(slot_id:, patient_id:, patient_name:)
        # Check if slot is available through DoctorAvailability module
        slot = DoctorAvailability.slot_service.find_slot(slot_id)

        raise "Slot not found" unless slot
        raise "Slot is already reserved" if slot.is_reserved

        appointment = Domain::Entities::Appointment.new(
          id: SecureRandom.uuid,
          slot_id: slot_id,
          patient_id: patient_id,
          patient_name: patient_name,
          reserved_at: Time.current
        )

        # Update slot status in DoctorAvailability module
        DoctorAvailability.slot_service.reserve_slot(slot_id)

        @appointment_repository.create(appointment)
      end
    end
  end
end
