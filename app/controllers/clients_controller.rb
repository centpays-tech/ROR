class ClientsController < ApplicationController

    def createClient
        client = Client.new(client_params)
        if client.save
          render json: { message: "Client created successfully", client: client }, status: :created
        else
          render json: { error: client.errors.full_messages.join(", ") }, status: :unprocessable_entity
        end
      rescue StandardError => e
        render json: { error: "Internal Server Error: #{e.message}" }, status: :internal_server_error
    end

    def getClient
      clients = Client.all
      render json: clients, status: :ok
    rescue StandardError => e
      render json: { error: "Internal Server Error" }, status: :internal_server_error
    end

    def updateClient
        @client = Client.find(params[:id])
      
        if @client.update(client_update_params)
          render json: { message: "Client updated successfully", client: @client }, status: :ok
        else
          render json: { error: @client.errors.full_messages.join(", ") }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Client not found" }, status: :not_found
      rescue StandardError => e
        render json: { error: "Internal Server Error: #{e.message}" }, status: :internal_server_error
    end
      
  
    private
  
    def client_params
      params.require(:client).permit(
        :company_name, :username, :email, :phone_number, :postal_code, :country,
        :state, :city, :street_address, :street_address2, :industries_id,
        :director_first_name, :director_last_name, :skype_id, :business_type,
        :business_category, :business_subcategory, :business_registered_on,
        :merchant_pay_in, :merchant_pay_out, :settlement_charge, :turnover,
        :expected_chargeback_percentage, :website_url, :merchant_id, :status,
        currency: []
      )
    end
  
    def client_update_params
      params.require(:client).permit(
        :company_name, :username, :email, :phone_number, :postal_code, :country,
        :state, :city, :street_address, :street_address2, :industries_id,
        :director_first_name, :director_last_name, :skype_id, :business_type,
        :business_category, :business_subcategory, :business_registered_on,
        :merchant_pay_in, :merchant_pay_out, :settlement_charge, :turnover,
        :expected_chargeback_percentage, :website_url, :merchant_id, :status,
        currency: []
      ).tap do |update_params|
        if update_params[:status] && update_params[:status] != "Inactive" && @client.status == "Inactive"
          update_params.delete(:status)
        end
      end
    end
  end
  