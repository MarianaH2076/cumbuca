defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """

  def main(_args) do
    welcome_text()
    start_program()
  end

  def welcome_text do
    IO.puts("
    Bem-vindo ao Programa de Recuperação dos Registros Históricos da Família Real de Cumbúquia!

    O reino de Cumbúquia perdeu seus registros históricos e com isso a numeração correta dos reis e rainhas foi esquecida.
    Para resolver esse problema e restaurar a ordem cronológica da realeza, desenvolvemos este programa especial.
    Este programa permitirá que você insira os nomes dos monarcas, e a partir daí, reconstruiremos a lista histórica da família real.\n
    INSTRUÇÕES:

    Você deve inserir um nome por linha e, quando não quiser mais inserir nenhum nome, basta pressionar ENTER que o programa será encerrado.\n

    Vamos?

    ==========================================")
  end

  def start_program do
    IO.puts("Digite os nomes dos reis e rainhas (pressione Enter caso queira encerrar): ")
    collect_names([])
  end

  def collect_names(list) do
    name = IO.gets("> ")
      |> String.trim()
      |> String.upcase()

    if name == "" do
      IO.puts("Lista de nomes: ")
      count_names(list)
      |> show_list()
    else
      collect_names(list ++ [name])
    end
  end

  def count_names(list) do
      Enum.reduce(list, {%{}, []}, fn name, {counters, result} ->
      counter = Map.get(counters, name, 0)
      new_counter = counter + 1

      new_counters = Map.put(counters, name, new_counter)

      new_result = ["#{name} #{arabic_to_roman(new_counter)}" | result]

        {new_counters, new_result}
    end)
    |> elem(1)
    |> reverse()
  end

  defp reverse(list) do
    reverse_aux(list, [])
  end

  defp reverse_aux([], acc), do: acc

  defp reverse_aux([head | tail], acc), do: reverse_aux(tail, [head | acc])

  defp show_list(list) do
    Enum.each(list, &IO.puts/1)
  end

  def arabic_to_roman(number), do: arabic_to_roman(number, "")

  defp arabic_to_roman(number, roman) when number >= 1000 do
    arabic_to_roman(number - 1000, roman <> "M")
  end

  defp arabic_to_roman(number, roman) when number >= 900 do
    arabic_to_roman(number - 900, roman <> "CM")
  end

  defp arabic_to_roman(number, roman) when number >= 500 do
    arabic_to_roman(number - 500, roman <> "D")
  end

  defp arabic_to_roman(number, roman) when number >= 400 do
    arabic_to_roman(number - 400, roman <> "CD")
  end

  defp arabic_to_roman(number, roman) when number >= 100 do
    arabic_to_roman(number - 100, roman <> "C")
  end

  defp arabic_to_roman(number, roman) when number >= 90 do
    arabic_to_roman(number - 90, roman <> "XC")
  end

  defp arabic_to_roman(number, roman) when number >= 50 do
    arabic_to_roman(number - 50, roman <> "L")
  end

  defp arabic_to_roman(number, roman) when number >= 40 do
    arabic_to_roman(number - 40, roman <> "XL")
  end

  defp arabic_to_roman(number, roman) when number >= 10 do
    arabic_to_roman(number - 10, roman <> "X")
  end

  defp arabic_to_roman(number, roman) when number >= 9 do
    arabic_to_roman(number - 9, roman <> "IX")
  end

  defp arabic_to_roman(number, roman) when number >= 5 do
    arabic_to_roman(number - 5, roman <> "V")
  end

  defp arabic_to_roman(number, roman) when number >= 4 do
    arabic_to_roman(number - 4, roman <> "IV")
  end

  defp arabic_to_roman(number, roman) when number >= 1 do
    arabic_to_roman(number - 1, roman <> "I")
  end

  defp arabic_to_roman(0, roman), do: roman

end
