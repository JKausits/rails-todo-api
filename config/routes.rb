Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:create, :index, :show, :update]
      post 'tasks/:id/complete', to: 'tasks#complete'
    end
  end
end
