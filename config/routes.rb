Rails.application.routes.draw do
  root to: redirect('/posts')

  devise_for :users
  resources :posts, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get 'pending'
      get 'ready'
      get 'ready_for_twitter'
    end
  end
end
