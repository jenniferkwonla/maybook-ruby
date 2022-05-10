module Api

class BookstackController < ApplicationController
  def index
    @bookStack = Bookstack.all
    render json: @bookStack
  end

  def show
    @bookStack = Bookstack.order('created_at DESC').first(1)
    render json: @bookStack, status: 200
  end

  def update
    if params[:bookid]
      @bookId = params[:bookid]
      @userids = params[:userids]
      Bookstack.where(id: @bookId).update(userids: @userids)
      render json: @bookStack, status:200
    end
  end

end
end
