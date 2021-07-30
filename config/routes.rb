Rails.application.routes.draw do
  resources :ad_confs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'ad_conf/best' => 'AdConfController#best'
end
