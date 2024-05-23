class SessionsController < ApplicationController
  require 'mail'
  require 'jwt'
  # def login
  #   email = params[:email]
  #   password = params[:password]
  #     begin
  #     user = User.find_by(email: email)
  
  #     if user && password
  #       render json: { message: "Login successful", user: user }, status: :ok
  #     else
  #       render json: { error: "Invalid credentials" }, status: :unauthorized
  #     end
  #   rescue => e
  #     Rails.logger.error e.message
  #     render json: { error: "Internal Server Error" }, status: :internal_server_error
  #   end
  # end

  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      token = encode_token(user_id: user.id)
      render json: { message: "Login successful", token: token, user: user }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end

  private

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def updateUsers
    id = params[:id]
    name = params[:name]
    email = params[:email]
    mobile_no = params[:mobile_no]
    country = params[:country]
    company_name = params[:company_name]

    begin
      existing_user = User.find_by(id: id)
      
      if existing_user.nil?
        return render json: { error: "User not found" }, status: :not_found
      end

      existing_user.name = name if name
      existing_user.email = email if email
      existing_user.mobile_no = mobile_no if mobile_no
      existing_user.country = country if country
      existing_user.company_name = company_name if company_name

      if existing_user.save
        render json: { message: "User updated successfully", user: existing_user }, status: :ok
      else
        render json: { error: existing_user.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    rescue => e
      Rails.logger.error e.message
      render json: { error: "Internal Server Error" }, status: :internal_server_error
    end
  end

  def userDetails
    id = params[:id]

    begin
      user = User.find_by(id: id)
      
      if user.nil?
        return render json: { message: "User not found" }, status: :not_found
      end

      user_details = {
        name: user.name,
        email: user.email,
        mobile_no: user.mobile_no,
        country: user.country,
        role: user.role,
        company_name: user.company_name
      }

      render json: user_details
    rescue => e
      Rails.logger.error e.message
      render json: { message: "Internal server error" }, status: :internal_server_error
    end
  end

  def send_otp_by_email
    email = params[:email]
    otp = params[:otp]

    begin
      user = User.find_by(email: email)
      
      unless user
        return render json: { success: false, message: "Invalid email" }, status: :bad_request
      end

      mail = Mail.new do
        from     'no.reply.centpays@gmail.com'
        to       email
        subject  'Your OTP for Email Verification'
        body     "Hello,\n\nYour one-time passcode (OTP) from Centpays is: #{otp}.\n\nPlease either Copy and Paste or enter the code manually when prompted. The code was requested and will be valid for 10 minutes."
      end

      mail.delivery_method :smtp, address: 'smtp.gmail.com', port: 587,
                                      user_name: 'no.reply.centpays@gmail.com',
                                      password: 'hkbm gogq vyni fzfy',
                                      authentication: 'plain',
                                      enable_starttls_auto: true

      mail.deliver!
      
      render json: { success: true, message: "OTP sent successfully" }, status: :ok
    rescue => e
      Rails.logger.error "Error sending email: #{e.message}"
      render json: { success: false, message: "Failed to send OTP email" }, status: :internal_server_error
    end
  end

  def resetPassword
    email = params[:email]
    new_password = params[:newpassword]
    confirm_password = params[:confirmpassword]

    begin
      user = User.find_by(email: email)
      
      unless user
        return render json: { success: false, message: "Invalid email" }, status: :bad_request
      end

      if new_password != confirm_password
        return render json: { success: false, message: "Passwords do not match" }, status: :bad_request
      end

      hashed_password = BCrypt::Password.create(new_password)

      user.password_digest = hashed_password
      user.save!

      render json: { success: true, message: "Password updated successfully" }, status: :ok
    rescue => e
      Rails.logger.error "Error updating password: #{e.message}"
      render json: { success: false, message: "Internal Server Error" }, status: :internal_server_error
    end
  end

  private

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end


end