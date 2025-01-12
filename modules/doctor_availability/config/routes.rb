DoctorAvailability::Engine.routes.draw do
  resources :slots, only: [:index, :create, :show, :update, :destroy] do
    collection do
      get :available
    end
  end
end
