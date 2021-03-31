class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy, :delete]
  layout "theme" #, except: [:pdf]
  # layout "pdf" ,only: [:pdf]

  # GET /invoices
  # GET /invoices.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: InvoicesDatatable.new(params, view_context: view_context) }
    end
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
    Drug.all.map {|d| @d[d.brand_name] = d.retail_price }
    @all_drugs = Drug.all.as_json
  end

  # GET /invoices/1/edit
  def edit
  end

  def delete
    if request.post?
      if params[:authentication_token] == ENV['DELETE_INVOICE_TOKEN']
        drug_ids = @invoice.invoice_drugs.pluck(:drug_id)
        #delete Invocie Drugs
        @invoice.invoice_drugs.map{|i_d| i_d.destroy!}
        #update Drug_stock
        Drug.where(id: drug_ids).map{|d| d.normalize}
        #delete Invoice
        @invoice.destroy
        respond_to do  |format|
          format.html { redirect_to invoices_path, notice: 'Invoice was successfully created.' }
        end
      else
        respond_to do  |format|
          format.html { redirect_to delete_invoice_path, notice: 'Access Denied.' }
        end
      end
    end
  end

  def pdf
    @invoice = Invoice.find(params[:invoice_id])
    respond_to do |format|
        format.pdf do
          render pdf: "application-#{@invoice.id}.pdf",
          template: "/invoices/pdf.pdf.erb",
          layout: 'pdf.html.erb'
        end
    end
  end

  # POST /invoices
  # POST /invoices.json
  def create
    invoice_date = params["invoice"]["invoice_date"]
    params["invoice"]["invoice_date"]  = invoice_date.to_date if invoice_date.present? rescue ""
    @invoice = Invoice.new(invoice_params)
    respond_to do |format|
      if params[:invoice_drugs].present? and params[:invoice_drugs].values.present? and @invoice.save
        params[:invoice_drugs].values.each do |invoice_drug|
          drug = Drug.find_by(brand_name: invoice_drug["drug_name"])
          if drug.present?
            drug.quantity = drug.quantity - invoice_drug["quantity"].to_i
            drug.save
            @invoice.invoice_drugs.create(drug_id: drug.id, discount: drug.discount, drug_name: invoice_drug["drug_name"], quantity: invoice_drug["quantity"], price: invoice_drug["price"])
          end

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
    # @invoice.drugs.each do |invoice_drug|
    #   invoice_drug.drug.update(quantity: ((invoice_drug.quantity.to_i rescue 0) + (invoice_drug.drug.quantity.to_i rescue 0)) )
    #   # invoice_drug.drug.update(quantity: (invoice_drug.quantity.to_i  + invoice_drug.drug.quantity.to_i))
    # end
    # @invoice.destroy
    # respond_to do |format|
    #   format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:total, :patient_name, :age, :discount, :gross, :invoice_date)
    end
    def invoice_drug_params invoice_drug
      # invoice_drug.permit("drug_name", "drug_id", "price", "quantity" )
    end
end
