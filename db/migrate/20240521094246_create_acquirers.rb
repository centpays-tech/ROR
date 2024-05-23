class CreateAcquirers < ActiveRecord::Migration[7.1]
  def change
    create_table :acquirers do |t|
      t.string :acquirer_name
      t.string :acquirer_email
      t.string :website_url
      t.string :city
      t.string :status, null: false, default: "Active"

      t.timestamps
    end
  end
end
