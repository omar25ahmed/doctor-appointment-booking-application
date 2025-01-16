module AppointmentBooking
  class Appointment < AppointmentBooking::ApplicationRecord
    self.table_name = 'appointment_booking_appointments'
  end
end
