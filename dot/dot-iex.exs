IEx.configure(colors: [eval_result: [:magenta, :bright]])

# IO.puts("Hello motherfucker!")

defmodule S do
  @moduledoc """
  S - System
  """

  @doc """
  h - halt
  """
  def h do
    System.halt()
  end
end
