module ApplicationHelper
  def bootstrap_class_for(type)
    case type.to_sym
    when :success then "alert-success"
    when :alert then "alert-danger"
    when :notice then "alert-info"
    else type.to_s
    end
  end
end
