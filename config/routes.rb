Rails.application.routes.draw do
  resources :keywords do
    member do
      delete 'delete'
    end
  end
  
  resources :stores do
    member do
      delete 'delete'
    end
  end
  
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

 root 'welcome#hello' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
