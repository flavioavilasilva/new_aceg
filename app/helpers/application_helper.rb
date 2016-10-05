module ApplicationHelper
  def friendly_date(date)
    I18n.l(date, format: '%d/%m/%Y %H:%M')
  end
end
