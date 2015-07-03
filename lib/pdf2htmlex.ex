defmodule Pdf2htmlex do
  def open(pdf) when is_binary(pdf), do: [pdf]
  def save_to(opts, dir) when is_list(opts), do: ["--dest-dir", dir] ++ opts
  def convert(opts) when is_list(opts), do: exec_cmd opts

  def zoom(opts, zoom_ratio) when is_list(opts) do
    zoom_as_str = Float.to_string(zoom_ratio, [decimals: 1, compact: true])
    ["--zoom", zoom_as_str] ++ opts
  end

  defp exec_cmd(opts) do
    cmd = System.find_executable("pdf2htmlex")
    System.cmd(cmd, opts, stderr_to_stdout: true)
  end
end