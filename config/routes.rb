Rails.application.routes.draw do
  root to: 'contacts#index'
  resources :contacts
  resources :agents do
    member do
      get '/set_default_contact', to: "agents#set_default_contact"
    end
  end
end
