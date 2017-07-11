module UsersHelper
  def boldify(text)
    "<strong>#{text}</strong>".html_safe
  end

  def bs_button(text)
    "<button class='btn btn-default'>#{text}</button>".html_safe
  end

end
