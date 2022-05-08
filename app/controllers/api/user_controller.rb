module Api

class UserController < ApplicationController
  
  # GET /user
  def index
    @users = User.all
    render json: @users
  end

  #GET /user/:userid
  def show
    @userId = params[:userid]
    @user = User.where(userid: @userId)
    render json: @user
  end

  def default_serializer_options
  	{root: false}
  end

  private
  def find_account
    @account=Account.find(params[:userid])
    render nothing: true, status: :not_found unless @account.present?

  end
end
