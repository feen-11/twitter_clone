# frozen_string_literal: true

module UsersHelper
  def format_date(date)
    date_obj = Date.strptime(date, '%Y%m%d')
    formatted_date = date_obj.strftime('%Y年%m月%d日')
  end
end
