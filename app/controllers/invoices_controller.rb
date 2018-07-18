class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  layout "theme"

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice_drugs = @invoice.invoice_drugs
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @d = Hash.new
    Drug.all.map {|d| @d[d.generic_name] = d.retail_price }
    @all_drugs = Drug.all.as_json
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    respond_to do |format|
      if params[:invoice_drugs].present? and params[:invoice_drugs].values.present? and @invoice.save
        debugger
        params[:invoice_drugs].values.each do |invoice_drug|
          drug = Drug.find_by(generic_name: invoice_drug["drug_name"])
          drug.quantity = drug.quantity - invoice_drug["quantity"].to_i
          drug.save
          @invoice.invoice_drugs.create(drug_name: invoice_drug["drug_name"], quantity: invoice_drug["quantity"], price: invoice_drug["price"])
        end
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:total, :patient_name, :age, :discount)
    end
    def invoice_drug_params invoice_drug
      # invoice_drug.permit("drug_name", "drug_id", "price", "quantity" )
    end
end