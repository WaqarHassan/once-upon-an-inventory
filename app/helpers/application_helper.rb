module ApplicationHelper
  def table_classes
    "table table-bordered table-striped table-hover table-condensed table-bordered table-hover pretty"
  end
  def form_title
     controller.action_name.humanize.to_s + " " + controller_name.humanize.singularize rescue ""
  end
  def date_format
    '%d %b, %Y'
  end
end

