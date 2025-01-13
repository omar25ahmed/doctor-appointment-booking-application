AppointmentBooking::Engine.routes.draw do
  resources :appointments, only: [:index, :show, :create]
end
