module FormHelper
  def error_message(resource, attribute)
    resource.errors.messages[attribute].first || ""
  end
end
