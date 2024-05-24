class UsersController < ApplicationController
    require 'bcrypt'
    def servertest
      render json: { message: 'Server is running well!' }, status: :ok
  end
  
    def signup
      begin
        name = params[:name]
        email = params[:email]
        mobile_no = params[:mobile_no]
        country = params[:country]
        role = params[:role] || 'user'
        password = params[:password]
        confirm_password = params[:password_confirmation]
        company_name = params[:company_name]

        if password != confirm_password
          return render json: { message: "Password and confirm password do not match" }, status: :bad_request
        end

        hashed_password = BCrypt::Password.create(password)

        user = User.new(
          name: name,
          email: email,
          mobile_no: mobile_no,
          country: country,
          role: role,
          password: hashed_password,
          company_name: company_name
        )
        user.save!
  
        render json: { message: "User created successfully" }, status: :created
      rescue => error
        logger.error(error.message)
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    def getUsers
        begin
          users = User.all
          render json: users, status: :ok
        rescue => error
          logger.error(error.message)
          render json: { error: "Internal Server Error" }, status: :internal_server_error
        end
    end

end
