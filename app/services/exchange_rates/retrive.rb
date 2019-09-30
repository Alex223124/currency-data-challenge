require 'money'
require 'money/bank/currencylayer_bank'

class Services::ExchangeRates::Retrive

  DEFAULT_TYPES = [{from: "EUR", to: "USD"},
                   {from: "EUR", to: "CHF"}]
  DEFAULT_PRECISION = 16
  DEFAULT_TRUNCATE = 6

  def initialize
    @rates = Money.default_bank.update_rates
    @result = []
  end

  def perform
    save
  end

  def save
    ActiveRecord::Base.transaction do
      ExchangeRate.delete_all
      rates.each do |rate|
        ExchangeRate.create!(source_currency: rate.keys[0][0],
                             target_currency: rate.keys[0][1],
                             rate: rate.values[0])
      end
    end
  end

  # CurrencylayerBank only allows USD as base currency
  # for the free plan users.
  def rates
    result =[]
    DEFAULT_TYPES.each do |type|
      result << calculate_rate_from(type[:from], type[:to])
    end
    result
  end

  def calculate_rate_from(currency, to_currency)
    { [currency, to_currency] => formula(currency, to_currency) }
  end

  def formula(currency_one, currency_two)
    (usd_to(currency_two) / usd_to(currency_one)).truncate(DEFAULT_TRUNCATE)
  end

  def usd_to(currency)
    if currency == "USD"
      BigDecimal(1)
    else
      BigDecimal(@rates["USD#{currency}"], DEFAULT_PRECISION)
    end
  end

end