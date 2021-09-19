  class UsersController < SecuredController
    # skip_before_action :authorize_request, only: [:create]
    def create
      @user = User.find_by(email: params[:email])
      return render json: { success: false, message: 'Email already exists' }, status: 409 if @user

      user = User.create!(user_params)
      render json: user, status: :created
    end

    def show
      @user = User.find(params[:email])
      return render json: @user, status: :ok if @user
    end

    private

    def user_params
      params.permit(:username, :email)
    end
  end
