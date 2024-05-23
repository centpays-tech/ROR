# app/controllers/currencies_controller.rb
class CurrenciesController < ApplicationController

    def createCurrency
        begin
          currency = Createcurrency.new(currency_params)
          if currency.save
            render json: { message: "Currency created successfully", currency: currency }, status: :created
          else
            render json: { error: currency.errors.full_messages.join(", ") }, status: :unprocessable_entity
          end
        rescue StandardError => e
          logger.error "Internal Server Error: #{e.message}" # Log the error message
          render json: { error: "Internal Server Error" }, status: :internal_server_error
        end
    end

    def getCurrency
      begin
        currencies = Createcurrency.all
        render json: currencies, status: :ok
      rescue StandardError => e
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    def deleteCurrency
        begin
          currency = Createcurrency.find_by(currency_name: params[:currency_name])
          if currency
            currency.destroy
            render json: { message: "Currency deleted successfully" }, status: :ok
          else
            render json: { error: "Currency not found" }, status: :not_found
          end
        rescue StandardError => e
          logger.error "Internal Server Error: #{e.message}"
          render json: { error: "Internal Server Error" }, status: :internal_server_error
        end
    end

    def updateCurrency
        begin
          currency = Createcurrency.find_by(id: params[:id])
          if currency
            currency_params = params.permit(:currency_name, :currency_code, :Status)
            if currency.update(currency_params)
              render json: { message: "Currency updated successfully", currency: currency }, status: :ok
            else
              render json: { error: currency.errors.full_messages.join(", ") }, status: :unprocessable_entity
            end
          else
            render json: { error: "Currency not found" }, status: :not_found
          end
        rescue StandardError => e
          logger.error "Internal Server Error: #{e.message}" # Log the error message
          render json: { error: "Internal Server Error" }, status: :internal_server_error
        end
    end
  
    private

    def currency_params
      params.require(:currency).permit(:currency_name, :currency_code, :Status)
    end
  end
  