class ExchangeRatesController < ApplicationController

  def new
    @exchange_rate = ExchangeRate.new
  end

  def create
    binding.pry
    @service = Services::ExchangeRates::Retrive.new
    @service.perform
    redirect_to exchange_operations_path, notice: 'Exchange rate was successfully created.'
  rescue => e
    binding.pry
    redirect_to action: :new, notice: e.message
  end

end
