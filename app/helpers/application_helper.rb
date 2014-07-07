module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Hotelsbd"      
    end
  end
end
