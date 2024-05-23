class BusinessSubcategoriesController < ApplicationController
    def createBusinesSubcategory
      begin
        business_subcategory = BusinessSubcategory.new(business_subcategory_params)
        business_subcategory.status ||= "Active"
  
        if business_subcategory.save
          render json: { message: "Business subcategory created successfully", business_subcategory: business_subcategory }, status: :created
        else
          render json: { error: business_subcategory.errors.full_messages }, status: :unprocessable_entity
        end
      rescue => error
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end
  
    def getBusinessSubcategory
      begin
        business_subcategories = BusinessSubcategory.all
        render json: business_subcategories, status: :ok
      rescue => error
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end
  
    def searchBusinessSubcategory
      begin
        search_criteria = {}
        search_criteria[:subcategory_name] = params[:subcategory_name] if params[:subcategory_name].present?
        search_criteria[:category_name] = params[:category_name] if params[:category_name].present?
        search_criteria[:status] = params[:status] if params[:status].present?
           business_subcategories = BusinessSubcategory.where(search_criteria)
           if business_subcategories.any?
          render json: { message: "Business subcategories found", business_subcategories: business_subcategories }, status: :ok
        else
          render json: { message: "Business subcategories not found" }, status: :not_found
        end
      rescue => error
        render json: { error: "Internal Server Error" }, status: :internal_server_error
     end
    end
    
    def deleteBusinessSubcategory
      begin
        business_subcategory = BusinessSubcategory.find_by(subcategory_name: params[:subcategory_name])
    
        if business_subcategory
          business_subcategory.destroy
          render json: { message: "Subcategory deleted successfully" }, status: :ok
        else
          render json: { error: "Subcategory not found" }, status: :not_found
          end
        rescue => error
          render json: { error: "Internal Server Error" }, status: :internal_server_error
        end
    end

    def updateBusinessSubcategory
        begin
          business_subcategory = BusinessSubcategory.find(params[:id])
          if business_subcategory.update(business_subcategory_params)
            render json: { message: "Business subcategory updated successfully", business_subcategory: business_subcategory }, status: :ok
          else
            render json: { error: business_subcategory.errors.full_messages }, status: :unprocessable_entity
          end
        rescue ActiveRecord::RecordNotFound
          render json: { error: "Business subcategory not found" }, status: :not_found
        rescue => error
          render json: { error: "Internal Server Error" }, status: :internal_server_error
        end
    end

    private
  
    def business_subcategory_params
      params.require(:business_subcategory).permit(:subcategory_name, :category_name, :status)
    end
  end
  