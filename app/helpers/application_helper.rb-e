module ApplicationHelper
  def show_error_messages_for( model, options = {} )
    output = ""
    
    header = options[:message] || "#{pluralize(model.errors.count, "error")} prohibited this #{model.class.name} from being saved:"
    
    if model.errors.any?
      output += "<div id=\"error_explanation\">"
      output += "<h2>#{header}</h2>"

      output += "<ul>"
      model.errors.full_messages.each do |msg|
        output += "<li>#{msg}</li>"
      end
      output += "</ul>"
      output += "</div>"
    end
    
    output.html_safe
  end
  
  def admin?
    controller.class.name.split("::").first=="Admin"
  end
  
  def show_time datetime
    datetime.strftime '%I:%M %p'
  end

  def show_short_date datetime
    if datetime
      datetime.strftime '%m.%d.%y'
    else
      "No Date Set"
    end
  end

  def std_date datetime
    if datetime
      datetime.strftime '%m/%d/%y'
    else
      "01/01/1000"
    end
  end
  
  def show_date_and_time datetime
    datetime.strftime '%A %B %d, %Y %I:%M %p'
  end
  
  def score_to_letter score
    if score >= 90
      return 'A'
    else
      if score >= 80
        return 'B'
      else
        if score >= 70
          return 'C'
        else
          if score >= 60
            return 'D'
          else
            return 'F'
          end
        end
      end
    end
  end

  def title text
    content_for :title do 
      text
    end
  end
  
  def slide_link( x, y )
    
  end
end
