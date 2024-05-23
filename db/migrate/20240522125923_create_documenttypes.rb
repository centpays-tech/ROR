class CreateDocumenttypes < ActiveRecord::Migration[7.1]
  def change
    create_table :documenttypes do |t|
      t.string :document_type
      t.string :status

      t.timestamps
    end
  end
end
