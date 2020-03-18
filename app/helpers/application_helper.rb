module ApplicationHelper
  def class_for_flash(type)
    case type
      when 'notice' then "primary"
      when 'alert' then "danger"
      when 'success' then "success"
      when 'error' then "warning"
    end
  end
end
