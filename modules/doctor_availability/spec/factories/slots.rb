FactoryBot.define do
  factory :doctor_availability_slot, class: 'DoctorAvailability::Slot' do
    doctor_id { 1 }
    doctor_name { 'Dr. Smith' }
    time { Time.current + 1.day }
    cost { 100.00 }
    is_reserved { false }
  end
end
