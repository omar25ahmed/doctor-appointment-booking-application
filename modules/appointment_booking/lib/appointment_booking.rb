require "appointment_booking/version"
require "appointment_booking/engine"

module AppointmentBooking
  class Error < StandardError; end

  class << self
    attr_accessor :appointment_service

    def configure
      yield self
    end
  end
end
