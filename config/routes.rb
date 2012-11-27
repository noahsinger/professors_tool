Ingenious::Application.routes.draw do
  # no namespace ##########################################    
  resources :general_contacts
  resources :instructors
  resources :sessions
  
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
  
  	resources :works do
  		member do
  			get "download"
  		end
  	end
    
    resources :students
    resources :enrollment_statuses
    resources :divisions
    resources :instructors
    resources :syllabus_parts
    resources :users
    resources :assignment_tweets
    
    resources :admin do
      collection do
        get 'email_template'
      #   get 'signin'
      #   post 'signin', :as => :signin
      #   get 'signout'
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
          get 'sync_students'
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
  
  match 'logout' => "sessions#destroy", :via => :delete
  match 'login' => "sessions#new", :via => :get
  
  # map.connect 'examples/echo', :controller => 'examples', :action => 'echo', :conditions => { :method => [:get, :post] }
  match 'examples/echo' => 'examples#echo', :method => [:get, :post]
  match 'examples/test_exception' => 'examples#test_exception', :method => [:get]
  match 'examples/test_notice' => 'examples#test_notice', :method => [:get]
  match 'examples/test_error' => 'examples#test_error', :method => [:get]
  match 'examples/test_tweet' => 'examples#test_tweet', :method => [:get]
end
