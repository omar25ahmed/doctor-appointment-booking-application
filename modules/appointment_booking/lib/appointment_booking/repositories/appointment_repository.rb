require_relative '../interfaces/repositories/appointment_repository_interface'

module AppointmentBooking
  module Repositories
    class AppointmentRepository < Interfaces::Repositories::AppointmentRepositoryInterface
      def initialize
        @appointments = []
      end

      def create(appointment)
        @appointments << appointment
        appointment
      end

      def find(id)
        @appointments.find { |appointment| appointment.id == id }
      end

      def find_by_slot_id(slot_id)
        @appointments.find { |appointment| appointment.slot_id == slot_id }
      end

      def list_all
        @appointments
      end
    end
  end
end
