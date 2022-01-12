defmodule EChroniclerWeb.ErrorView do
  use EChroniclerWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.html", _assigns) do
  #   "Internal Server Error"
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".

  def render("500.html", _assigns) do
    "Internal Server Error"
  end

  # def render("400.html", _assigns) do
  #   "Bad Request"
  # end
end
