require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '30s' do
  Rails.logger.info "Fetching live data from API..."

  begin
    LiveTransactionTablesController.new.get_livedata
  rescue => e
    Rails.logger.error "Error in fetching live data: #{e.message}"
  end
end