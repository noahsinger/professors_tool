ActionController::Routing::Routes.draw do |map|
  map.resources :examples

  # no namespace ##########################################    
  map.resources :general_contacts # , :member => {:download => :get}
  
  # semesters namespace #######################################
  map.resources :semesters do |semesters|
    semesters.resources :sections, :member => {:syllabus => :get} # <-- was member = :request_grades => :get
    semesters.resources :sections do |sections|
      sections.resources :grade_requests
      sections.resources :assignments do |assignments|
        assignments.resources :works, :collection => {:status => :get, :withdraw => :get} # <-- was collection = :work_return => :get
        assignments.resources :homework_return_requests
      end
    end
  end
  
  # courses namespace #######################################
  map.resources :courses do |courses|
    courses.resources :sections    
    
    courses.resources :how_tos do |howto|
      howto.resources :steps
    end
    
    courses.resources :labs do |labs|
      labs.resources :requirements
    end
  end
    
  # admin namespace #######################################
  map.namespace :admin do |admin|
    
    admin.resources :admin, :collection => {:signin => :get, :signout => :get}
    
    admin.resources :general_contacts, :collection => {:destroy_all => :delete}
    
    admin.resources :semesters do |semesters|
      semesters.resources :sections, :member => {:section_email => :get}
      semesters.resources :sections do |sections|
        sections.resources :students
        sections.resources :enrollments
        sections.resources :examples
        
        sections.resources :assignments do |assignments|
          assignments.resources :works, :member => {:grade => :get, :record_score => :put, :destroy_grade => :delete}, :collection => {:new_for_all => :get}
          assignments.resources :works do |works|
            works.resources :awarded_points
          end
        end
      end
    end
    
    admin.resources :courses do |courses|
      courses.resources :materials
      courses.resources :books
      courses.resources :tutorials, :collection => {:sort => :post, :add_how_to => :post}
      courses.resources :objectives
      courses.resources :policies, :collection => {:sort => :post, :add_syllabus_part => :post}
            
      courses.resources :labs do |labs|
        labs.resources :requirements
        labs.resources :extras
      end
    end

    admin.resources :students
    admin.resources :enrollment_statuses
    admin.resources :divisions
    admin.resources :instructors

    admin.resources :how_tos do |howto|
      howto.resources :steps, :collection => {:sort => :post}
    end
    
    admin.resources :syllabus_parts
    admin.resources :users
    admin.resources :grade_requests, :collection => {:destroy_all => :delete}
    admin.resources :homework_return_requests, :collection => {:destroy_all => :delete}
  end

  map.resources :instructors
  # map.connect 'instructors/:id', :controller => 'instructors', :action => 'show'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
    # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # map.connect 'admin', :controller => '/admin/sections', :action => 'index', :semester_id => Semester.current.id
  map.connect 'admin', :controller => '/admin/admin', :action => 'index'

  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)  

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  if Semester.current
    map.root :controller => "/sections", :action => 'index', :semester_id => Semester.current.id
  else
    map.root :controller => "/semesters", :action => 'index'
  end
  
  map.connect 'examples/echo', :controller => 'examples', :action => 'echo', :conditions => { :method => [:get, :post] }

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  # map.connect '/works/*path', :controller => 'redirector', :action => 'works'
end
