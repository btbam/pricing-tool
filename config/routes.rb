Rails.application.routes.draw do
  devise_for :users
  mount Platform::API => '/'
  root to: redirect('/api'), as: :unauthenticated_root
end
