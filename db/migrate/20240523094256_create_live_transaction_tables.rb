class CreateLiveTransactionTables < ActiveRecord::Migration[7.1]
  def change
    create_table :live_transaction_tables do |t|
      t.integer :livedata_id
      t.string :txnid
      t.string :merchantTxnId
      t.string :merchant
      t.float :amount
      t.float :fee
      t.float :merchant_fee
      t.string :backUrl
      t.string :merchant_id
      t.string :transactiondate
      t.string :statusBKP
      t.string :Status
      t.integer :isSettled
      t.string :settledDate
      t.string :settledTxnId
      t.float :settledAmount
      t.integer :router
      t.string :description
      t.string :email
      t.string :currency
      t.string :env
      t.string :mode
      t.string :paymentgateway
      t.string :payment_id
      t.string :pg_order_key
      t.string :message
      t.string :webhook_id
      t.string :requested_phone
      t.string :orderNo
      t.string :cname
      t.string :tempUpdated
      t.string :is_admin_settled
      t.string :admin_settled_date
      t.float :admin_settled_amount
      t.string :cardtype
      t.string :requestMode
      t.string :cardnumber
      t.string :cardExpire
      t.string :cardCVC
      t.string :pdate
      t.string :country
      t.string :dels
      t.string :web_url
      t.string :mid
      t.integer :from_temp
      t.string :accountHolder
      t.string :accountBankCode
      t.string :accountNumber
      t.string :birthDate
      t.string :internal_callback
      t.string :internal_callback_time

      t.timestamps
    end

    add_index :live_transaction_tables, :livedata_id, unique: true
  end
end
