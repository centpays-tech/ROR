class DocumenttypesController < ApplicationController

    def createDocumenttype
      begin
        document_type = Documenttype.new(documenttype_params)
  
        if document_type.save
          render json: { message: "Document type created successfully", document_type: document_type }, status: :created
        else
          render json: { error: document_type.errors.full_messages.join(", ") }, status: :unprocessable_entity
        end
      rescue StandardError => e
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    def getDocumenttypes
      begin
        document_types = Documenttype.all
        render json: document_types, status: :ok
      rescue StandardError => e
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    def deleteDocumenttype
      begin
        document_type = Documenttype.find_by(document_type: params[:document_type])
  
        if document_type.nil?
          render json: { error: "Document type not found" }, status: :not_found
        else
          document_type.destroy
          render json: { message: "Document type deleted successfully" }, status: :ok
        end
      rescue StandardError => e
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    def updateDocumenttype
      begin
        document_type = Documenttype.find_by(id: params[:id])
  
        if document_type.nil?
          render json: { error: "Document type not found" }, status: :not_found
        else
          if document_type.update(documenttype_params)
            render json: { message: "Document type updated successfully", document_type: document_type }, status: :ok
          else
            render json: { error: document_type.errors.full_messages.join(", ") }, status: :unprocessable_entity
          end
        end
      rescue StandardError => e
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end
  
    private
  
    # Strong parameters
    def documenttype_params
      params.permit(:document_type, :Status)
    end
  end
  