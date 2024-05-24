require 'rufus-scheduler'

# Only start the scheduler in one thread
return if defined?(Rails::Console) || Rails.env.test? || File.split($0).last == 'rake'

scheduler = Rufus::Scheduler.singleton

scheduler.every '30s' do
  Rails.logger.info "Fetching live data from API..."

  begin
    LiveTransactionTablesController.new.get_livedata
  rescue => e
    Rails.logger.error "Error in fetching live data: #{e.message}"
  end
end

