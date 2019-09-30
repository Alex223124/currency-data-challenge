class ExchangeRatesController < ApplicationController

  def new
    @exchange_rate = ExchangeRate.new
  end

  def create
    @service = Services::ExchangeRates::Retrive.new
    @service.perform
    redirect_to exchange_operations_path, notice: 'Exchange rate was successfully created.'
  rescue => e
    redirect_to action: :new, notice: e.message
  end

end
