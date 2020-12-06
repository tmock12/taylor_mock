defmodule TaylorMockWeb.UserSessionView do
  use TaylorMockWeb, :view

  def input_error_class(error_message) do
    if error_message do
      "border-red-400 placeholder-red-500"
    end
  end
end
