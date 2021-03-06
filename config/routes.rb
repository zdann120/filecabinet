Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :docs do
    get 'versions/:version_id' => 'docs#version', as: 'version'
  end
  get 'welcome/index'
  authenticated :user do
    root 'docs#index', as: 'authenticated_root'
  end
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
