Rails.application.routes.draw do

  resources :planets do
    resources :moons
  end

end
