require 'doctor_availability/engine'

module DoctorAvailability
  class << self
    def slot_service
      @slot_service ||= SlotService.new
    end

    def slot_repository
      @slot_repository ||= SlotRepository.new
    end
  end
end
