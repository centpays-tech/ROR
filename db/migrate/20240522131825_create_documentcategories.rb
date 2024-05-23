class CreateDocumentcategories < ActiveRecord::Migration[7.1]
  def change
    create_table :documentcategories do |t|
      t.string :document_name
      t.string :document_type
      t.string :side
      t.integer :document_number
      t.string :status

      t.timestamps
    end
  end
end
