module ApplicationHelper

  def admin?
    user_signed_in? && current_user.admin?
  end

  def number_to_currency_byn(number)
    number_to_currency(number, unit: "BYN", separator: ",", delimiter: ".")
  end

  def cart_count_page_over_one
    if @cart.line_items.count > 0
      return "<span class='tag is-red'>#{@cart.line_items.count}</span>".html_safe
    end
  end

  def cart_has_items
    return @cart.line_items.count
  end
end
