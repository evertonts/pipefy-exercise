module ApplicationHelper
  def format_date(date)
    return unless date

    date.strftime('%d/%m/%Y')
  end
end
