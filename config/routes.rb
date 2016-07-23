CornerbackTraining::Application.routes.draw do


  devise_for :admins,
    controllers: {
      sessions: "admin/sessions"
    },
    path_names: { 
       sign_out: "logout", 
       sign_in: "login", 
    }

  devise_scope :user do
    get "upgrade", to: "registrations#edit_plan"
    put "upgrade", to: "registrations#upgrade", as: :upgrade_plan
    get "users/register", to: "registrations#new", as: :purchase_plan
    post "users/register", to: "registrations#create"
    get "free-trial", to: "registrations#new"
    post "free-trial", to: "registrations#create"
    get "purchase-cornerback-training-plan", to: "registrations#new"
    post "purchase-cornerback-training-plan", to: "registrations#create"
  end

  devise_scope :admin do
    get 'admin', to: "admin/sessions#new"
  end

  resources :charges

  get 'dashboard', to: "admin/dashboard#index", as: :admin_dashboard
  get 'privacy-policy', to: "pages#privacy", as: :privacy_policy
  get 'terms-and-conditions', to: "pages#terms", as: :terms_and_conditions
  namespace :admin do
    resources :users do
      member do
        put :downgrade
        put :upgrade
      end
    end
    resources :admin_users
    resources :pages do
      member do
        put :privatize
        put :publicize
      end
    end
  end

  match '/404', to: 'errors#not_found'
  match '/422' => 'errors#server_error'
  match '/500' => 'errors#server_error'
    


  devise_for :users, 
    controllers: {
      registrations: "registrations",
      omniauth_callbacks: "omniauth_callbacks", 
      passwords: "users/passwords"
    }, 
    path_names: { 
       sign_out: "logout", 
       sign_in: "login", 
       sign_up: "register" 
    }

  root to: "welcome#index"
  get '/hangout' => 'general#hangout'
  get '/email-confirm' => 'general#email_confirm'
  get '/trial-confirm' => 'general#trial_confirm'
  get '/trial' => 'general#trial', as: :trial
  get '/train' => 'general#train', as: :train
  get '/cornerback_training_goals' => 'general#cornerback_training_goals'
  get '/cornerback_training_phases' => 'general#cornerback_training_phases'
  get '/cornerback_training_weekly_breakdown' => 'general#cornerback_training_weekly_breakdown'
  get '/cornerback_training_schedule' => 'general#cornerback_training_schedule'
  get '/cornerback_training_workout_structure' => 'general#cornerback_training_workout_structure'


  resource :profile, only: [:edit, :update]
  resource :performance_test, only: [:edit, :update]

  resources :pages

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
