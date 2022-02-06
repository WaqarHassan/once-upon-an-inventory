class DrugsStocksDatatable < AjaxDatatablesRails::ActiveRecord

    def initialize(params, opts = {})
      @view = opts[:view_context]
      super
    end
  
    def view_columns
      @view_columns ||= {
        invoice_number: { source: "DrugsStock.invoice_number", cond: :like, searchable: true},
        invoice_date: { source: "DrugsStock.invoice_date", cond: :like, searchable: true },
        drug: {source: "Drug.brand_name", searchable: true},
        quantity: {source: "", searchable: false},
        retail_price: {source: "", searchable: false},
        trade_price: {source: "", searchable: false},
        purchase_price: {source: "", searchable: false},
        company: {source: "Company.name", searchable: true},
        dt_action: {source: "", searchable: false }
      }
    end
  
    def data
      records.map do |record|
        {
          invoice_number: record.invoice_number,
          invoice_date: record.invoice_date,
          drug: record.drug&.brand_name,
          quantity: record.quantity,
          retail_price: record.retail_price,
          trade_price: record.trade_price,
          purchase_price: record.purchase_price,
          company: record.company&.name,
          is_return: record.is_return,
          dt_action: action_column(record)
        }
      end
    end
  
    def get_raw_records
        DrugsStock.includes(:drug, :company).order(created_at: :desc).references(:drugs, :company)
    end
  
    def action_column(record)
      "#{@view.link_to("Show", @view.drugs_stock_path(record.id), class:"btn  btn-success")}".html_safe
    end
  
  end
  