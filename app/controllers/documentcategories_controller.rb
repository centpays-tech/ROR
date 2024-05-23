class DocumentcategoriesController < ApplicationController

    def createDocumentcategory
      begin
        document_category = Documentcategory.new(documentcategory_params)
  
        if document_category.save
          render json: { message: "Document category created successfully", document_category: document_category }, status: :created
        else
          render json: { error: document_category.errors.full_messages.join(", ") }, status: :unprocessable_entity
        end
        rescue StandardError => e
        logger.error "Internal Server Error: #{e.message}" # Log the error message
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    def getDocumentcategories
      begin
        document_categories = Documentcategory.all
        render json: document_categories, status: :ok
      rescue StandardError => e
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    def deleteDocumentcategory
      begin
        document_category = Documentcategory.find_by(document_name: params[:document_name])
  
        if document_category.nil?
          render json: { error: "Document category not found" }, status: :not_found
        else
          document_category.destroy
          render json: { message: "Document category deleted successfully" }, status: :ok
        end
      rescue StandardError => e
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    def updateDocumentcategory
      begin
        document_category = Documentcategory.find_by(id: params[:id])
  
        if document_category.nil?
          render json: { error: "Document category not found" }, status: :not_found
        else
          if document_category.update(documentcategory_params)
            render json: { message: "Document category updated successfully", document_category: document_category }, status: :ok
          else
            render json: { error: document_category.errors.full_messages.join(", ") }, status: :unprocessable_entity
          end
        end
      rescue StandardError => e
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end
  
    private

    def documentcategory_params
      params.permit(:document_name, :document_type, :side, :document_number, :Status)
    end
  end
  