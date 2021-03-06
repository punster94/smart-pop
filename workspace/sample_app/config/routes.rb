SampleApp::Application.routes.draw do
  resources :users
  resources :courses
  resources :student_course_pairings
  resources :responses
  resources :response_containers
  resources :sessions, only: [:new, :create, :destroy]
  resources :teachers, only: [:show]
  resources :quizzes
  root 'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/signup',  to: 'users#new'           , via: 'get'
  match '/courses', to: 'courses#show'       ,  via: 'get'
  match '/verify',  to: 'universities#verify',  via: 'get'
  get 'student_course_pairings/new/:course_id', to: 'student_course_pairings#new'
  delete 'student_course_pairings/:course_id/removepairing', to: 'student_course_pairings#destroy'
  get 'student_course_pairings/:id/verify', to: 'student_course_pairings#verify'
  get 'register/:university_id', to: 'teachers#register'
  get 'teachers/:teacher_id/verify', to: 'teachers#verify'
  get 'quizzes/new/:course_id', to: 'quizzes#new'
  get 'quizzes/:id/start', to: 'quizzes#manual_start'
  get 'quizzes/:id/end', to: 'quizzes#manual_end'
  get 'quizzes/delay', to: 'quizzes#delay'
  get 'quizzes/:id/take', to: 'quizzes#take'
  get 'quizzes/:id/show', to: 'quizzes#show'
  get 'response_containers/:id/show', to: 'response_containers#show'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
