module DoctorAvailability
  class SlotRepository
    def all
      Slot.all
    end

    def available
      Slot.where(is_reserved: false)
    end

    def create(params)
      Slot.create!(params)
    end

    def update(id, params)
      slot = find(id)
      slot.update!(params)
      slot
    end

    def delete(id)
      slot = find(id)
      slot.destroy
    end

    private

    def find(id)
      Slot.find(id)
    end
  end
end
