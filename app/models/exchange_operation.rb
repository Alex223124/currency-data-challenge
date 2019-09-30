class ExchangeOperation < ApplicationRecord

  validates_presence_of :from_currency, :amount, :to_currency

  before_save :set_result

  def set_result
    binding.pry
    rate = ExchangeRate.where(source_currency: self.from_currency, target_currency: self.to_currency).first.try(:rate)
    binding.pry
    self.result = self.amount * rate
  end

end