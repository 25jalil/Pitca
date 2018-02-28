module Admin::MonitoringsHelper
  def date_inspect?(var)
    if Date.parse(var) == Date.today
      true
    else
      false
    end   
  end
end