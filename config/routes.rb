Rails.application.routes.draw do
  get 'statis_pages/home'

  get 'statis_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
