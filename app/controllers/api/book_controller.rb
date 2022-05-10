module Api
  
class BookController < ApplicationController
  
  # POST /book
  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: 200
    else
      render error: {error: 'Unable to create book.', status: 400}
    end
    #end
  end

  # GET /book
  def index
    @books = Book.all.order('created_at DESC')
    render json: @books
  end

  # GET /book/:param -- TODO: change maxbookstoprocess to number
  def show
    if params[:id]
      @bookId = params[:id]
      @book = Book.find(@bookId)
      render json: @book
    end
    if params[:maxbookstoprocess]
      @maxNumber = params[:maxbookstoprocess]
      @books = Book.order('created_at DESC').first(10)
      render json: @books, status: 200
    end
    if params[:title]
      @title = params[:title]
      @book = Book.where(title: @title).first(1)
      render json: @book, status: 200
    end
    if params[:author]
      @title = params[:author]
      @book = Book.where(title: @author)
      render json: @book, status: 200
    end
  end

  def stack
    if params[:maxbookstoprocess]
      @maxNumber = params[:maxbookstoprocess]
      @books = Book.order('created_at DESC').first(10)
      render json: @books, status: 200
    end
  end

  def googlevolumeids
    @googlevolumeids = Book.distinct.pluck(:googlevolumeid)
    render json: @googlevolumeids, status: 200
  end

  # PUT /book/:title -- not in use 
  def update
    @title=params[:title]
    @imageUrl=params[:imageUrl]
    
    #@imageUrl=params[:image]
    Book.find(@bookId).update(image: @imageUrl)
    render json: @bookId

    # @book = Book.find(@bookId)
    # book.update_attributes(image: @imageUrl)
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, 
    :category1, :category2, :category3,
    :description1, :description2, :description3, 
    :image, :googlevolumeid)
  end

  def default_serializer_options
  	{root: false}
  end

end  
end