# lib/tasks/scheduler.rb
require 'rufus-scheduler'
require_relative '../../app/controllers/live_transaction_tables_controller'
scheduler = Rufus::Scheduler.new

scheduler.every '1m' do
  LiveTransactionTablesController.new.getLivedata(nil, nil) 
end

# Keep the script running to continue scheduling tasks
scheduler.join
