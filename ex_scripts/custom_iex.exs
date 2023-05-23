
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

  def re, do: recompile()
end
