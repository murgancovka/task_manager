module ApplicationHelper
  
  def get_model_errors(model)
    str=""
    if model
        model.errors.each do |key, val|
            str=str+val.to_s+"<br/>"
        end
    end  
    return str.html_safe
  end
  
end
