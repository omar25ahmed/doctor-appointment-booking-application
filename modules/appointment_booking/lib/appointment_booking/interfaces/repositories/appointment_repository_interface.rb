module AppointmentBooking
  module Interfaces
    module Repositories
      class AppointmentRepositoryInterface
        def create(appointment)
          raise NotImplementedError
        end

        def find(id)
          raise NotImplementedError
        end

        def find_by_slot_id(slot_id)
          raise NotImplementedError
        end

        def list_all
          raise NotImplementedError
        end
      end
    end
  end
end
