# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'boards#index', as: 'home'

  get 'tasks/new/:step_id', to: 'tasks#new', as: 'new_task'
  patch 'tasks/sort/:step_id', to: 'tasks#sort', as: 'sort_tasks'
  resources :tasks, except: %i[new index show]

  get 'steps/new/:board_id', to: 'steps#new', as: 'new_step'
  patch 'steps/sort', to: 'steps#sort', as: 'sort_steps'
  resources :steps, except: %i[new index show]

  resources :boards
end
