class ExchangeOperationsController < ApplicationController
  before_action :set_exchange_operation, only: [:show]

  def index
    @exchange_operations = ExchangeOperation.all
  end

  def show
  end

  def new
    @exchange_operation = ExchangeOperation.new
  end

  def create
    @exchange_operation = ExchangeOperation.new(exchange_operation_params)

    if @exchange_operation.save
      redirect_to @exchange_operation, notice: 'Exchange operation was successfully created.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange_operation
      @exchange_operation = ExchangeOperation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exchange_operation_params
      params.require(:exchange_operation).permit(:from_currency, :amount, :to_currency, :result)
    end
end
