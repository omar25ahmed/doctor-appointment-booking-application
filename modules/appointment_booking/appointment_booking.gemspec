require_relative "lib/appointment_booking/version"

Gem::Specification.new do |spec|
  spec.name        = "appointment_booking"
  spec.version     = AppointmentBooking::VERSION
  spec.authors     = ["Your Name"]
  spec.summary     = "Appointment Booking module for Doctor Appointment System"
  spec.description = "Handles appointment booking functionality using Clean Architecture"

  spec.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]
  
  spec.add_dependency "rails", "~> 6.1.7"
  spec.add_dependency "doctor_availability"
end
