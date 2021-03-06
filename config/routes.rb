Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # no namespace ##########################################
  resources :general_contacts
  resources :instructors
  resources :sessions

  # semesters namespace #######################################
  resources :semesters do
    get 'current', on: :collection

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

    resources :admin
    resources :enrollment_statuses
    resources :divisions
    resources :instructors
    resources :syllabus_parts
    resources :assignment_tweets

  	resources :works do
  		member do
  			get "download"
  		end
  	end

    resources :students do
      collection do
        get :search
      end
    end

    resources :how_tos do
      resources :steps do
        collection do
          post 'sort'
        end
      end
    end

    resources :general_contacts do
      collection do
        delete :destroy_all
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

    # admin semesters namespace #####################
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
        resources :meetings do
		      resources :attendances
	      end

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

    # admin courses namespace #####################
    resources :courses do
      resources :waiters
      resources :materials
      resources :books
      resources :websites
      resources :tutorials do
        collection do
          post 'sort'
          post 'add_how_to'
        end
      end

      resources :objectives do
        collection do
          post 'sort'
        end
      end

      resources :policies do
        collection do
          post 'sort'
          post 'add_syllabus_part'
        end
      end

      resources :labs do
        member do
          post 'duplicate'
        end

        resources :requirements do
          collection do
            post 'sort'
          end
        end

        resources :extras
      end
    end
  end

  get '/admin', to: 'admin/admin#index'

  root "semesters#current"

  match 'logout' => "sessions#destroy", via: :delete
  match 'login' => "sessions#new", via: :get

  match 'examples/echo' => 'examples#echo', via: [:get, :post]
  match 'examples/test_exception' => 'examples#test_exception', via: [:get]
  match 'examples/test_notice' => 'examples#test_notice', via: [:get]
  match 'examples/test_error' => 'examples#test_error', via: [:get]
  match 'examples/test_tweet' => 'examples#test_tweet', via: [:get]
end
