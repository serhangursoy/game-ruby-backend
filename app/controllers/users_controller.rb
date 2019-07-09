class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, except: []

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render json: { status: "success", message: "Users returned successfully!", data: @users}, status: :ok
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: { status: "success", message: "User returned successfully!", data:@user}, status: :ok
  end

  # GET /users/new
  def new
    # @user = User.new
    render json: { status: "success", message: "User created successfully!", data:@user}, status: :ok
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
      if @user.save
        render json: { status: "success", message: "User created successfully!", data:@user}, status: :ok
      else
        render json: { status: "error",message:"Sad error. Couldn't create user"}
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_username(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username)
    end
end
