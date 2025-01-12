$:.push File.expand_path("lib", __dir__)

Gem::Specification.new do |spec|
  spec.name        = "doctor_availability"
  spec.version     = "0.1.0"
  spec.authors     = ["Your Name"]
  spec.summary     = "Doctor Availability module"
  spec.description = "Handles doctor availability and slot management"

  spec.files = Dir["{app,config,db,lib}/**/*"]

  spec.add_dependency "rails", "~> 6.1.0"
end
