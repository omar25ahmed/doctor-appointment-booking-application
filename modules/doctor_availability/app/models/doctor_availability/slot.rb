module DoctorAvailability
  class Slot < DoctorAvailability::ApplicationRecord
    self.table_name = 'doctor_availability_slots'

    before_create :set_uuid
    before_save :format_cost

    # Validations
    validates :time, presence: true
    validates :doctor_id, presence: true
    validates :doctor_name, presence: true
    validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0 }

    # Scopes
    scope :available, -> { where(is_reserved: false) }
    scope :reserved, -> { where(is_reserved: true) }
    scope :upcoming, -> { where('time > ?', Time.current) }
    scope :past, -> { where('time <= ?', Time.current) }

    # Methods
    def reserve!
      update!(is_reserved: true)
    end

    def cancel_reservation!
      update!(is_reserved: false)
    end

    def available?
      !is_reserved
    end

    def past?
      time <= Time.current
    end

    def upcoming?
      time > Time.current
    end

    def as_json(options = {})
      super(options).tap do |json|
        json['cost'] = sprintf('%.2f', json['cost']) if json['cost']
      end
    end

    private

    def set_uuid
      self.id = SecureRandom.uuid
    end

    def format_cost
      self.cost = sprintf('%.2f', cost) if cost
    end
  end
end
