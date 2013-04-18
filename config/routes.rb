ClioInOutStub::Application.routes.draw do

  devise_for :users

  resources :users, :only => [:index, :show, :edit, :update] do
    member do
      get :status
    end
  end

  root :to => "users#index"

end
