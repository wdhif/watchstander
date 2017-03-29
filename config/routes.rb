Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'docker#dashboard'

  get '/containers' => 'docker#containers'
  post '/start_container' => 'docker#start_container', as: :start_container
  post '/stop_container' => 'docker#stop_container', as: :stop_container
  post '/kill_container' => 'docker#kill_container', as: :kill_container
  post '/delete_container' => 'docker#delete_container', as: :delete_container

  get '/images' => 'docker#images'
end
