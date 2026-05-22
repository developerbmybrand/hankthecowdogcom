class Admin::BooksController < Admin::BaseController

  def index
    @books = Book.ordered('book_volume_number')

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @book = Book.new
    @book.book_sortweight = 0

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_parms)

    respond_to do |format|
      if @book.save
        format.html { redirect_to([:admin, @book], :notice => 'Book was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(book_parms)
        format.html { redirect_to([:admin, @book], :notice => 'Book was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to('/admin/books')
  end

  private
  def book_parms
    params.require(:book).permit(
      :book_title, 
      :book_desc, 
      :book_excerpt_title, 
      :book_excerpt_detail, 
      :book_volume_number, 
      :book_audio, 
      :book_image, 
      :book_link, 
      :book_featured, 
      :book_sortweight, 
      :book_published, 
      :book_linkaudible, 
      :book_linkcd
    )
  end
end
