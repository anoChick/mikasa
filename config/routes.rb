Rails.application.routes.draw do
  resource :keyword
  root 'top#index'
end
