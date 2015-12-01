module ApplicationHelper
  def display_date(input_date)
    if input_date
      return input_date.strftime("%m/%d/%Y")
    end
    return ""
  end

  def display_date_w_day(input_date)
    if input_date
      return input_date.strftime("%a, %b %d, %Y")
    end
    return ""
  end

  def display_short_date(input_date)
    if input_date
      return input_date.strftime("%b %d, %Y")
    end
    return ""
  end

  def display_date_time(input_date)
    if input_date
      return input_date.strftime("%m/%d/%Y %I:%M %p")
    end
    return ""
  end

  def display_time(input_time)
    if input_time
      return input_time.strftime("%I:%M %p")
    end
    return ""
  end

end
