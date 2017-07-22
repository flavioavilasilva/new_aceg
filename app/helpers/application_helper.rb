module ApplicationHelper
  def friendly_date(date)
    I18n.l(date, format: '%d/%m/%Y %H:%M')
  end

  def ong_admin?(ong)
    return false if ong.nil?
    ong_signed_in? && current_ong.id == ong.id
  end

  def user_admin?(user)
    return false if user.nil?
    user_signed_in? && current_user.id == user.id
  end
end
