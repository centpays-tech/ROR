class LiveTransactionTablesController < ApplicationController
    
    require 'httparty'
    def get_livedata
        response = HTTParty.get("https://centpays.com/apidoc/get_all_transaction")
      
        if response.success?
          data = JSON.parse(response.body)['data']
      
          data.each do |item|
            LiveTransactionTable.create!(
              livedata_id: item['id'],
              txnid: item['transactionId'],
              merchantTxnId: item['mtxnID'],
              merchant: item['merchant_name'],
              amount: item['amount'],
              fee: item['fee'],
              merchant_fee: item['merchant_fee'],
              backUrl: item['backUrl'],
              merchant_id: item['merchant_id'],
              transactiondate: item['transaction_date'],
              statusBKP: item['statusBKP'],
              Status: item['status'],
              isSettled: item['isSettled'],
              settledDate: item['settledDate'],
              settledTxnId: item['settledTxnId'],
              settledAmount: item['settledAmount'],
              router: item['router'],
              description: item['description'],
              email: item['email'],
              currency: item['currency'],
              env: item['env'],
              mode: item['mode'],
              paymentgateway: item['payment_mode'],
              payment_id: item['payment_id'],
              pg_order_key: item['order_key'],
              message: item['message'],
              webhook_id: item['webhook_id'],
              requested_phone: item['requested_phone'],
              orderNo: item['requested_orderNumber'],
              cname: item['requested_name'],
              tempUpdated: item['tempUpdated'],
              is_admin_settled: item['is_admin_settled'],
              admin_settled_date: item['admin_settled_date'],
              admin_settled_amount: item['admin_settled_amount'],
              cardtype: item['cardType'],
              requestMode: item['requestMode'],
              cardnumber: item['cardNo'],
              cardExpire: item['cardExpire'],
              cardCVC: item['cardCVC'],
              pdate: item['pdate'],
              country: item['country'],
              dels: item['dels'],
              web_url: item['web_url'],
              mid: item['mid'],
              from_temp: item['from_temp'],
              accountHolder: item['accountHolder'],
              accountBankCode: item['accountBankCode'],
              accountNumber: item['accountNumber'],
              birthDate: item['birthDate'],
              internal_callback: item['internal_callback'],
              internal_callback_time: item['internal_callback_time'],
            )
          end
        else
          Rails.logger.error "Failed to fetch data from API: #{response.code} - #{response.message}"
        end
      end
      
end
