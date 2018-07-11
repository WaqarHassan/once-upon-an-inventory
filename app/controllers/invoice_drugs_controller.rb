class InvoiceDrugsController < ApplicationController
  before_action :set_invoice_drug, only: [:show, :edit, :update, :destroy]

  # GET /invoice_drugs
  # GET /invoice_drugs.json
  def index
    @invoice_drugs = InvoiceDrug.all
  end

  # GET /invoice_drugs/1
  # GET /invoice_drugs/1.json
  def show
  end

  # GET /invoice_drugs/new
  def new
    @invoice_drug = InvoiceDrug.new
  end

  # GET /invoice_drugs/1/edit
  def edit
  end

  # POST /invoice_drugs
  # POST /invoice_drugs.json
  def create
    @invoice_drug = InvoiceDrug.new(invoice_drug_params)

    respond_to do |format|
      if @invoice_drug.save
        format.html { redirect_to @invoice_drug, notice: 'Invoice drug was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_drug }
      else
        format.html { render :new }
        format.json { render json: @invoice_drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_drugs/1
  # PATCH/PUT /invoice_drugs/1.json
  def update
    respond_to do |format|
      if @invoice_drug.update(invoice_drug_params)
        format.html { redirect_to @invoice_drug, notice: 'Invoice drug was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_drug }
      else
        format.html { render :edit }
        format.json { render json: @invoice_drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_drugs/1
  # DELETE /invoice_drugs/1.json
  def destroy
    @invoice_drug.destroy
    respond_to do |format|
      format.html { redirect_to invoice_drugs_url, notice: 'Invoice drug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_drug
      @invoice_drug = InvoiceDrug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_drug_params
      params.require(:invoice_drug).permit(:drug_name, :drug_id)
    end
end
