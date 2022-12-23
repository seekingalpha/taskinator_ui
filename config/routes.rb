TaskinatorUi::Engine.routes.draw do
  root to: 'processes#index'
  resources :processes do
    get :children
  end
end
