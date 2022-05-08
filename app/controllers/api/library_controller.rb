module Api

class LibraryController < ApplicationController

    # POST /library 
    def create
        @library = Library.new(library_params)
        if @library.save
            render json: @library, status: 200
        else 
            render error:{error: 'Unable to create a library.', status: 400}
        end
    end

    # GET /library -- must return an array
    def index
        @userId=params[:userid]
        @libraries=Library.where(userid: @userId)
        render json: @libraries
    end

    # GET /library/:userid 
    def show
        @userId=params[:userid]
        @library=Library.where(userid: @userId).order("created_at DESC")
        if @library
            render json: @library, status: 200
        else 
            render json: {error: 'Invalid user id', status: 400}
        end
    end

    # PUT -- not in use, use if POST doesnt work
    def update
        @userid=params[:userid]
        @newLibrary = Library.new(library_params)
        if @newLibrary.save
            #@libraries = Library.where(userid: @userid).order("created_on DESC").first # must return a list of library records
            render json: @newLibrary, status: 200
        else
            render error:{error: 'Unable to create a library.', status: 400}
        end
    end

    private
    def library_params
      params.require(:love).permit(:userid, :books)
    end

    def default_serializer_options
        {root: false}
    end
end
end
