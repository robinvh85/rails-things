Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'things#index'

  get 'things/index_ajax'
  get 'things/create_random'
  get 'things/destroy_all'
  get 'things/cookie_show'
end
