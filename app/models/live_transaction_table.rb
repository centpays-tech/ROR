class LiveTransactionTable < ApplicationRecord
    validates :livedata_id, uniqueness: true
  
    # enum isSettled: { unsettled: 0, settled: 1 }
    # enum from_temp: { not_temp: 0, temp: 1 }

    # validates :merchant, presence: true
    # validates :amount, presence: true, numericality: true
    # validates :statusBKP, inclusion: { in: %w(Pending Success Failed) }
    # validates :Status, inclusion: { in: %w(Pending Success Failed) }
    # validates :isSettled, inclusion: { in: isSettled.values }
    # validates :currency, inclusion: { in: %w(USD EUR GBP) }
  end
  