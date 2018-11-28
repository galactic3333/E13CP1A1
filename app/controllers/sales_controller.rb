class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    @discount = @sale.value.to_i * ( @sale.discount.to_f / 100 )
    @sale.total = @sale.value.to_i - @discount.to_i

    if @sale.tax == 0
      @sale.total = @sale.total * 1.19
      @sale.tax = 19
    else
      @sale.tax = 0
    end

    @sale.save
    redirect_to sales_done_path
  end

  def done
    @sale = Sale.last
  end

  private

  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end
end
