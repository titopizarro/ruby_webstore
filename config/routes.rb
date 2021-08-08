Rails.application.routes.draw do
  resources :products do
    member do
      delete 'delete'
    end
  end

  resources :categories do
    member do
      delete 'delete'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
