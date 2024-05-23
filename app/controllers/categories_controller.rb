class CategoriesController < ApplicationController
    
    def createCategory
      begin
        category = Category.new(category_params)
  
        if category.save
          render json: { message: "Category created successfully", category: category }, status: :created
        else
          render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
        end
      rescue => e
        logger.error e.message
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    def getCategory
      begin
        categories = Category.all
        render json: categories, status: :ok
      rescue => e
        logger.error e.message
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end
    
    def deleteCategory
      begin
        category_name = params[:category_name]
             existing_category = Category.find_by(category_name: category_name)
        if existing_category.nil?
          render json: { error: "Category not found" }, status: :not_found
        else
          existing_category.destroy
          render json: { message: "Category deleted successfully" }, status: :ok
        end
      rescue => e
        logger.error e.message
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    def updateCategory
      begin
        existing_category = Category.find_by(id: params[:id])
  
        unless existing_category
          return render json: { error: "Category not found" }, status: :not_found
        end
  
        if params[:category_name]
          existing_category.category_name = params[:category_name]
        end
        if params[:short_name]
          existing_category.short_name = params[:short_name]
        end
        if params[:Status]
          existing_category.Status = params[:Status]
        end
  
        if existing_category.save
          render json: { message: "Category updated successfully", category: existing_category }, status: :ok
        else
          render json: { error: existing_category.errors.full_messages.join(", ") }, status: :unprocessable_entity
        end
      rescue => e
        logger.error e.message
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    private

    def category_params
      params.require(:category).permit(:category_name, :short_name, :status)
    end
  end
  