Ingenious::Application.routes.draw do
  # no namespace ##########################################    
  resources :general_contacts
  resources :instructors
  
  # semesters namespace #######################################
  resources :semesters do
    resources :sections do
      member do
         get 'syllabus'
      end
    end
    resources :sections do
      resources :examples
      resources :grade_requests
      resources :assignments do
        resources :works do
          collection do
             get 'withdraw'
          end
        end
        resources :homework_return_requests
      end
    end
  end
  
  # courses namespace #######################################
  resources :courses do
    resources :sections    
    resources :waiters
    resources :materials
    
    member do
      get 'syllabus'
    end
    
    resources :how_tos do
      resources :steps
    end
    
    resources :labs do
      resources :requirements
    end
  end
    
  # admin namespace #######################################
  namespace :admin do
    
    resources :students
    resources :enrollment_statuses
    resources :divisions
    resources :instructors
    resources :syllabus_parts
    resources :users
    
    resources :admin do
      collection do
        get 'signin'
        post 'signin', :as => :signin
        get 'signout'
      end
    end
    
    resources :general_contacts do
      collection do
        delete :destroy_all
      end
    end
    
    resources :semesters do
      resources :sections do
        member do
          get 'section_email'
          get 'export_gradebook'
        end
      end
      
      resources :sections do
        resources :students
        resources :enrollments
        resources :examples
        
        resources :assignments do
          resources :works do
            member do
              get 'grade'
              put 'record_score'
              delete 'destroy_grade'
              get 'download'
            end
            
            collection do
                get 'new_for_all'
            end
          end
          resources :works do
            resources :awarded_points
          end
        end
      end
    end
    
    resources :courses do
      resources :waiters
      resources :materials
      resources :books
      resources :tutorials do
        collection do
          post 'sort'
          post 'add_how_to'
        end
      end
      
      resources :objectives
      resources :policies do
        collection do
          post 'sort'
          post 'add_syllabus_part'
        end
      end
            
      resources :labs do
        resources :requirements
        resources :extras
      end
    end

    resources :how_tos do
      resources :steps do
        collection do
          post 'sort'
        end
      end
    end
    
    resources :grade_requests do
      collection do
        delete 'destroy_all'
      end
    end
    
    resources :homework_return_requests do
      collection do
        delete 'destroy_all'
      end
    end
  end
  
  match 'admin' => 'admin/admin#index', :as => :admin

  if Semester.current
    root :to => "sections#index", :semester_id => Semester.current.id
  else
    root :to => "semesters#index"
  end
  
  # map.connect 'examples/echo', :controller => 'examples', :action => 'echo', :conditions => { :method => [:get, :post] }
  match 'examples/echo' => 'examples#echo', :method => [:get, :post]
  match 'examples/test_exception' => 'examples#test_exception', :method => [:get]
  match 'examples/test_notice' => 'examples#test_notice', :method => [:get]
  match 'examples/test_error' => 'examples#test_error', :method => [:get]
  match 'examples/test_tweet' => 'examples#test_tweet', :method => [:get]

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
