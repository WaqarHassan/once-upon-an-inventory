class DrugsStocksController < ApplicationController
  before_action :set_drugs_stock, only: [:show, :edit, :update, :destroy]
  layout "theme"
  # GET /drugs_stocks
  # GET /drugs_stocks.json
  def index
    @drugs_stocks = DrugsStock.order('created_at DESC')
  end

  # GET /drugs_stocks/1
  # GET /drugs_stocks/1.json
  def show
  end

  # GET /drugs_stocks/new
  def new
    @drugs_stock = DrugsStock.new
  end

  # GET /drugs_stocks/1/edit
  def edit
  end

  # POST /drugs_stocks
  # POST /drugs_stocks.json
  def create
    invoice_date = params["drugs_stock"]["invoice_date"]
    params["drugs_stock"]["invoice_date"]  = invoice_date.to_date if invoice_date.present? rescue ""
    @drugs_stock = DrugsStock.new(drugs_stock_params)
    respond_to do |format|
      if @drugs_stock.save
        update_drug
        format.html { redirect_to drugs_stocks_path, notice: 'Drugs stock was successfully created.' }
        format.json { render :show, status: :created, location: @drugs_stock }
      else
        format.html { render :new }
        format.json { render json: @drugs_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drugs_stocks/1
  # PATCH/PUT /drugs_stocks/1.json
  def update
    respond_to do |format|
      if @drugs_stock.update(drugs_stock_params)
        # update_drug     # This line fucked me . update edited drug stock . messed up!
        @drugs_stock.drug.update(drug_params)
        format.html { redirect_to drugs_stocks_path, notice: 'Drugs stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @drugs_stock }
      else
        format.html { render :edit }
        format.json { render json: @drugs_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs_stocks/1
  # DELETE /drugs_stocks/1.json
  def destroy
    @drugs_stock.destroy
    respond_to do |format|
      format.html { redirect_to drugs_stocks_url, notice: 'Drugs stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drugs_stock
      @drugs_stock = DrugsStock.find(params[:id])
    end
    def update_drug
      @drugs_stock.drug.update(drug_params)
      # debugger
      quantity = @drugs_stock.drug.quantity.to_i + params[:drugs_stock][:quantity].to_i
      discount = @drugs_stock.discount + (100 - @drugs_stock.discount) * (@drugs_stock.additional_discount.to_f / 100)
      # debugger
      @drugs_stock.drug.update(quantity: quantity , discount: discount)
    end
    def drug_params
      params.require(:drugs_stock).permit(:retail_price, :trade_price, :purchase_price,:company_id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def drugs_stock_params
      params.require(:drugs_stock).permit(:retail_price, :trade_price, :purchase_price, :drug_id, :company_id,:quantity,:discount ,:additional_discount,:distributor_id, :invoice_date , :invoice_number)
    end
end
