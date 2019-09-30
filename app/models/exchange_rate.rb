class ExchangeRate < ApplicationRecord

  validates_presence_of :source_currency, :target_currency, :rate

end