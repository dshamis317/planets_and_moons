Rails.application.routes.draw do
  root 'planets#index'
  resources :planets do
    resources :moons
  end

end
