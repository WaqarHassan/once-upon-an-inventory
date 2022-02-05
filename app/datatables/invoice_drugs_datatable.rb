class InvoiceDrugsDatatable < ApplicationDatatable

    def initialize(params, opts = {})
      @view = opts[:view_context]
      super
    end
  
    def view_columns
      @view_columns ||= {
        date: { source: "Invoice.invoice_date", searchable: false },
        invoice_id: { source: "InvoiceDrug.invoice_id", searchable: true },
        patient_name: { source: "Invoice.patient_name", searchable: true},
        drug_name: { source: "InvoiceDrug.drug_name", searchable: true },
        quantity: { source: "InvoiceDrug.quantity", searchable: false},
      }
    end
  
    def data
      records.map do |record|
        {
          date: record.invoice.invoice_date,
          invoice_id: record.invoice_id,
          patient_name: record.invoice.patient_name,
          drug_name: record.drug_name,
          quantity: record.quantity,
        }
      end
    end
  
    def get_raw_records
      InvoiceDrug.includes(:invoice).references(:invoice).order(created_at: :desc)
    end
  
  end
  