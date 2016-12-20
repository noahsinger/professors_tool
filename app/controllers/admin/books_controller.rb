class Admin::BooksController < ApplicationController
  before_action :authenticate  
  before_action :load_course
  
  def load_course
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  def index
    @books xxx@xxx.xxx
  end
  
  # GET /books/new
  # GET /books/new.xml
  def new
    @book xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /books/1/edit
  def edit
    @book xxx@xxx.xxx
  end

  # POST /books
  # POST /books.xml
  def create
    @book xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Book was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render xml: @book, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
   xxx@xxx.xxx = Book.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Book was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
   xxx@xxx.xxx = Book.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      @status = xxx@xxx.xxx
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:book).permit(:title, :author, :isbn, :publisher, :required)
  end 
end
