class BusinesstypesController < ApplicationController
  
    def createBusinessType
      begin
        business_type = Businesstype.new(business_type_params)
        business_type.status ||= "Active"
  
        if business_type.save
          render json: { message: "Business type created successfully", business_type: business_type }, status: :created
        else
          render json: { error: business_type.errors.full_messages }, status: :unprocessable_entity
        end
      rescue => error
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end
  
    def getBusinessType
      begin
        business_types = Businesstype.all
        render json: business_types, status: :ok
      rescue => error
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    def searchBusinessType
        begin
          search_criteria = {}
          search_criteria[:businesstype_name] = params[:businesstype_name] if params[:businesstype_name].present?
          search_criteria[:status] = params[:status] if params[:status].present?
    
          found_business_types = Businesstype.where(search_criteria)
    
          if found_business_types.any?
            render json: { message: "Business types found", business_types: found_business_types }, status: :ok
          else
            render json: { message: "Business types not found" }, status: :not_found
          end
        rescue => error
          render json: { error: "Internal Server Error" }, status: :internal_server_error
        end
    end
    
    def deleteBusinessType
        begin
          businesstype_name = params[:businesstype_name]
    
          existing_business_type = Businesstype.find_by(businesstype_name: businesstype_name)
    
          if existing_business_type
            existing_business_type.destroy
            render json: { message: "Business type deleted successfully" }, status: :ok
          else
            render json: { error: "Business type not found" }, status: :not_found
          end
        rescue => error
          render json: { error: "Internal Server Error" }, status: :internal_server_error
        end
    end
  
    def updateBusinessType
        begin
          business_type = Businesstype.find(params[:id])
    
          if business_type.update(business_type_params)
            render json: { message: "Business type updated successfully", business_type: business_type }, status: :ok
          else
            render json: { error: business_type.errors.full_messages }, status: :unprocessable_entity
          end
        rescue ActiveRecord::RecordNotFound
          render json: { error: "Business type not found" }, status: :not_found
        rescue => error
          render json: { error: "Internal Server Error" }, status: :internal_server_error
        end
    end

    private
  
    def business_type_params
      params.require(:businesstype).permit(:businesstype_name, :status)
    end
  end
  