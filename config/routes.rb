# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'boards#index', as: 'home'
  resources :boards
end
