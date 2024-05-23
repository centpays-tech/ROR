# app/controllers/banks_controller.rb
class BanksController < ApplicationController

    def createBank
      @bank = Bank.new(bank_params)
  
      if @bank.save
        render json: { message: "Bank created successfully", bank: @bank }, status: :created
      else
        render json: { error: @bank.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end
    end

    def getBank
      @banks = Bank.all
      render json: @banks
    end

    def deleteBank
        bank_name = params[:bank_name]
        @bank = Bank.find_by(bank_name: bank_name)
      
        if @bank
          if @bank.destroy
            render json: { message: "Bank '#{bank_name}' deleted successfully" }, status: :ok
          else
            render json: { error: "Failed to delete bank '#{bank_name}'" }, status: :unprocessable_entity
          end
        else
          render json: { error: "Bank '#{bank_name}' not found" }, status: :not_found
        end
    end

    def updateBank
        @bank = Bank.find(params[:id])
  
        if @bank.update(bank_params)
        render json: { message: "Bank updated successfully", bank: @bank }, status: :ok
     else
        render json: { error: @bank.errors.full_messages.join(", ") }, status: :unprocessable_entity
        end
    end
  
  
    private

    def bank_params
      params.require(:bank).permit(:bank_name, :div_id, :bank_url, :status)
    end
  end
  