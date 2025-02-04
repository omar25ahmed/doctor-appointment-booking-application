Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount DoctorAvailability::Engine => '/doctor_availability'
  mount AppointmentBooking::Engine => '/appointment_booking'
end
