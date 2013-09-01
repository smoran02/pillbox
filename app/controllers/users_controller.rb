class UsersController < ApplicationController
  before_action :signed_in_user, only: [:update, :edit, :weekly]
  before_action :correct_user, only: [:update, :edit, :show]
  before_action :admin_user, only: [:destroy, :index]

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

	def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to PillBox!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.all
    render 'index'
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def weekly
    @user = current_user
    @sunday = Date.today.beginning_of_week(:sunday)
    @sun_daily = current_user.dailies.find_by(report_for: @sunday)
    @monday = Date.today.beginning_of_week(:sunday) + 1.day
    @mon_daily = current_user.dailies.find_by(report_for: @monday)
    @tuesday = Date.today.beginning_of_week(:sunday) + 2.days
    @tues_daily = current_user.dailies.find_by(report_for: @tuesday)
    @wednesday = Date.today.beginning_of_week(:sunday) + 3.days
    @wed_daily = current_user.dailies.find_by(report_for: @wednesday)
    @thursday = Date.today.end_of_week(:sunday) - 2.days
    @thurs_daily = current_user.dailies.find_by(report_for: @thursday)
    @friday = Date.today.end_of_week(:sunday) - 1.day
    @fri_daily = current_user.dailies.find_by(report_for: @friday)
    @saturday = Date.today.end_of_week(:sunday)
    @sat_daily = current_user.dailies.find_by(report_for: @saturday)
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password,
  																 :password_confirmation)
  	end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end

    def admin_user
      redirect_to root_url unless signed_in?
      if signed_in?
        redirect_to user_path(current_user) unless current_user.admin?
      end
    end

end
