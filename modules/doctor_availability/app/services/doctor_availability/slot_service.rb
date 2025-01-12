module DoctorAvailability
  class SlotService
    def list_slots
      Slot.all
    end

    def list_available_slots
      Slot.where(is_reserved: false)
    end

    def find_slot(id)
      Slot.find(id)
    end

    def create_slot(params)
      Slot.new(params)
    end

    def update_slot(id, params)
      slot = find_slot(id)
      slot.update!(params)
      slot
    end

    def delete_slot(id)
      slot = find_slot(id)
      slot.destroy
    end
  end
end
