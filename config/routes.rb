Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # You can have the root of your site routed with "root"
  root to: 'exams#index'

  resources :exams do
    collection do
      post 'list'
    end
  end

  resources :exam_choise_selects
end
