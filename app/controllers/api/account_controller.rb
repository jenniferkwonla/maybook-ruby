module Api

class AccountController < ApplicationController
    #before_action :find_account, only: [:index, :update]
    
    # POST /account
    def create
      @account = Account.new(account_params)
      if @account.save
        render json: @account, status: 200
      else
        render error: {error: 'Unable to create account.', status: 400}
      end
    end

    # GET /account
    def index
        @accounts = Account.all
        render json: @accounts
    end

    # GET /account/:userid
    def show
      @userId=params[:userid]
      @password=params[:password]
      @account = Account.where(userid: @userId, password: @password);
      if @account
        render json: @account, status: 200
      else
        render json: {error: 'Invalid login', status: 400}
      end
    end

    # Test below
    # PUT /account/:id
    def update
      @account = Account.find(params[:id])
      if @account
        @account.update(account_params)
        render json: {message: 'Account successfully updated.', status: 200}
      else
        render json: {error: 'Unable to update Account.', status: 400 }
      end 
    end


    def destroy
      if params[:id]
        @userId = params[:id]
        Account.find(@userId).destroy
        render status: 200
      end
    end
    
    private
    def account_params
      params.require(:account).permit(:userid, :password)
    end

    #not in use
    def find_account
      #@account=Account.find(params[:userid])
      @account=Account.where('userid': @json['userid'])
      render nothing: true, status: :not_found unless @account.present?
  
    end

    def default_serializer_options
      {root: false}
    end
end
end
