class InvoicesDatatable < ApplicationDatatable

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      invoice_number: { source: "Invoice.id", searchable: false },
      patient_name: { source: "Invoice.patient_name", },
      age: {source: "Invoice.age", searchable: false},
      amount: {source: "Invoice.total", searchable: false},
      date: {source: "Invoice.invoice_date", searchable: false},
      dt_action: {source: "", searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        invoice_number: record.id,
        patient_name: record.patient_name,
        age: record.age,
        amount: record.total,
        date: record.invoice_date,
        dt_action: action_column(record)
      }
    end
  end

  def get_raw_records
    Invoice.includes(:invoice_drugs)
  end

  def action_column(record)
    "#{@view.link_to("Generate Pdf", @view.invoice_pdf_path(invoice_id: record.id, format: :pdf), class: "btn btn-bitbucket", target: "_blank")}
    #{@view.link_to("View", @view.invoice_path(record.id), class:"btn  btn-success")}
    #{@view.link_to("Delete", @view.delete_invoice_path(record.id), class: "btn btn-success")}".html_safe
  end

end
