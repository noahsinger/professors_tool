class Admin::BooksController < ApplicationController
  before_filter :authenticate  
  before_filter :load_course
  
  def load_course
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  # GET /books/1
  # GET /books/1.xml
  def show
    @book xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
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
        flash[:notice] = 'Book was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @book, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
   xxx@xxx.xxx = Book.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Book was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
   xxx@xxx.xxx = Book.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
    end
  end
  
end
