module DateHelper
  def date(val)
    return val.strftime("%d/%m/%Y") if val
    return nil
  end

  def time(val)
    return val.strftime("%H:%M:%S") if val
    return nil
  end

  def datetime(val)
    return val.strftime("%d/%m/%Y %H:%M:%S") if val
    return nil
  end

  def h_datetime(val)
    if val && val.to_date == Date.today
      return "hoje #{val.strftime("%H:%M:%S")}"
    elsif val && val.to_date == Date.today - 1
      return "ontem #{val.strftime("%H:%M:%S")}"
    elsif val
      return "#{val.strftime("%d/%m/%Y %H:%M:%S")} (#{time_ago_in_words(val)})"
    else
      return nil
    end
  end

  def h_lean_datetime(val, remove_time_when_midnight = false)
    if val && val.to_date == Date.today
      return "hoje" if remove_time_when_midnight && val.hour == 0 && val.min == 0 && val.sec == 0
      return "hoje #{val.strftime("%H:%M:%S")}"
    elsif val && val.to_date == Date.today - 1
      return "ontem" if remove_time_when_midnight && val.hour == 0 && val.min == 0 && val.sec == 0
      return "ontem #{val.strftime("%H:%M:%S")}"
    elsif val
      return "#{val.strftime("%d/%m/%Y")}" if remove_time_when_midnight && val.hour == 0 && val.min == 0 && val.sec == 0
      return "#{val.strftime("%d/%m/%Y %H:%M:%S")}"
    else
      return nil
    end
  end
end