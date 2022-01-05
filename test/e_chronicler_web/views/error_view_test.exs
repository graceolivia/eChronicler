defmodule EChroniclerWeb.ErrorViewTest do
  use EChroniclerWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(EChroniclerWeb.ErrorView, "404.html", []) =~ "The page you are looking for could not be found. Sorry!"
  end

  test "renders 500.html" do
    assert render_to_string(EChroniclerWeb.ErrorView, "500.html", []) == "Internal Server Error"
  end
end
