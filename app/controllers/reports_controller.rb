class ReportsController < ApplicationController
  layout "theme"
  def generate
    if request.post?
      if params[:type] == "stock"
        @drugs_stocks =  DrugsStock.where(invoice_date: params[:start_date].to_date..params[:end_date].to_date)
      elsif params[:type] == "sales"
        @Invoices =  Invoice.where(invoice_date: params[:start_date].to_date..params[:end_date].to_date)
      end
    end
    respond_to  do |f|
      f.html {render :index}
    end
  end
end
