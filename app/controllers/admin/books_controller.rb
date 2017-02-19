class Admin::BooksController < ApplicationController
  before_action :authenticate  
  before_action :load_course
  
  def load_course
    @course = Course.find( params[:course_id] )
  end
  
  def index
    @books = @course.books.all;
  end
  
  # GET /books/new
  # GET /books/new.xml
  def new
    @book = @course.books.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = @course.books.find(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    @book = @course.books.build(allowed_params)

    respond_to do |format|
      if @book.save
        @status = admin_course_books_url(@course)
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to(admin_course_books_url(@course)) }
        format.xml  { render xml: @book, status: :created, location: @book }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @book.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(allowed_params)
        @status = admin_course_books_url(@course)
        flash[:notice] = 'Book was successfully updated.'
        format.html { redirect_to(admin_course_books_url(@course)) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @book.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      @status = admin_course_books_url(@course)
      format.html { redirect_to(admin_course_books_url(@course)) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:book).permit(:title, :author, :isbn, :publisher, :required)
  end 
end
