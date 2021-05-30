module ApplicationHelper
  include Pagy::Frontend

  def table_classes
    "table table-bordered table-striped table-hover table-condensed table-bordered table-hover pretty"
  end

  def form_title
     controller.action_name.humanize.to_s + " " + controller_name.humanize.singularize rescue ""
  end

  def date_format
    '%d %b, %Y'
  end

  def get_customer_discount(invoice_drug)
    (invoice_drug.amount * (@invoice.discount / 100)).round(2)
  end

  def get_drug_discount(invoice_drug)
    (invoice_drug.amount * (invoice_drug.discount / 100)).round(2)
  end

end

