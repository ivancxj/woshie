Rails.application.routes.draw do
  # root 'welcome#index'

  get '/513', to: 'welcome#index'
end
