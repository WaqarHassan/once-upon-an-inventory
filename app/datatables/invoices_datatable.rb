class InvoicesDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      invoice_number: { source: "Invoice.id", searchable: false },
      patient_name: { source: "Invoice.patient_name", },
      age: {source: "Invoice.age", searchable: false},
      amount: {source: "Invoice.total", searchable: false},
      date: {source: "Invoice.invoice_date", searchable: false},
    }
  end

  def data
    records.map do |record|
      {
        invoice_number: record.id,
        patient_name: record.patient_name,
        age: record.age,
        amount: record.total,
        date: record.invoice_date
      }
    end
  end

  def get_raw_records
    Invoice.includes(:invoice_drugs)
  end

  # def action_column
  #   <%= link_to "Generate Pdf" , invoice_pdf_path(invoice,format: :pdf ) , class: "btn btn-bitbucket" ,target: "_blank" %>
  #   #         <%= link_to "View ", invoice_path(invoice.id), class: "btn  btn-success"%>
  #   #         <%= link_to "Delete" , delete_invoice_path(invoice) , class: "btn btn-danger"  %> %>
  # end

end
