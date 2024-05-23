class AcquirersController < ApplicationController

    def createAcquirer
      @acquirer = Acquirer.new(acquirer_params)
  
      if @acquirer.save
        render json: { message: "Acquirer created successfully", acquirer: @acquirer }, status: :created
      else
        render json: @acquirer.errors, status: :unprocessable_entity
      end
    end

    def getAcquirer
      @acquirers = Acquirer.all
      render json: @acquirers, status: :ok
    end
  
    private

    def acquirer_params
      params.require(:acquirer).permit(:acquirer_name, :acquirer_email, :website_url, :city, :status)
    end
  end
  