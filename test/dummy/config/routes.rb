Rails.application.routes.draw do
  resources :users
  mount ActiveAdminBootstrap::Engine => "/active_admin_bootstrap"
end
