module ApplicationHelper
  def show_time datetime
    datetime.strftime '%I:%M %p'
  end

  def show_short_date datetime
    datetime.strftime '%m.%d.%y'
  end

  def std_date datetime
    datetime.strftime '%m/%d/%y'
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
