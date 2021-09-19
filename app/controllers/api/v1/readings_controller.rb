class Api::V1::ReadingsController < SecuredController
    def index
      @user = User.includes(:readings).find(params[:email])
      render json: @user.readings, status: :ok
      
    end

    def create
      new_reading = Reading.create!(reading_params)

      render json: new_reading, status: :created
    end

    private
    def reading_params
        params.permit(:user_email, :fasting, :after_meal, :bp, :date)
    end
end
