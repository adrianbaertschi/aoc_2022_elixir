defmodule Day11 do
  defmodule Monkey do
    defstruct id: 0, items: [], operation: {}, test_div: 0, if_true: 0, if_false: 0
  end

  def part_one(input) do
    monkeys = input |> parse()

    print_state(monkeys)

    monkeys = monkeys |> Enum.reduce(monkeys, fn {k, v}, acc -> run(k, v, acc) end)

    print_state(monkeys)
    monkeys
  end

  defp run(k, monkey, all_monkeys) do
    IO.inspect(monkey.id)

    #    IO.inspect(monkey.items |> Enum.join(", "))
    all_monkeys =
      monkey.items
      |> Enum.reduce(all_monkeys, fn item, acc ->
        s = Map.get(acc, k)
        item = calc(item, s.operation)
        to = target(monkey, item)
        t = Map.get(acc, to)
        
        IO.puts("Monkey #{monkey.id}: throw #{item} to #{to}")
        acc = Map.put(acc, to, %{t | items: t.items ++ [item]})

        #        IO.inspect(s.items |> Enum.join(", "))
        s_items = Enum.drop(s.items, 1)
        Map.update!(acc, k, fn m -> %{m | items: s_items} end)
      end)

    #    IO.inspect(e)

    #    all_monkeys = Map.put(all_monkeys, k, monkey)
    all_monkeys
    #    acc = Map.put(all_monkeys, k, monkey)
  end

  defp target(monkey, item) do
    to =
      if rem(item, monkey.test_div) == 0 do
        monkey.if_true
      else
        monkey.if_false
      end

    to

    #    IO.inspect(item)
  end

  defp calc(item, {op, num}) do
    item =
      case op do
        "*" -> item * num
        "+" -> item + num
        "^" -> item ** num
      end

    trunc(item / 3)
  end

  defp print_state(monkeys) do
    IO.puts("\n======== state ======")

    monkeys
    |> Enum.map(fn {k, v} -> "Monkey #{k}: #{v.items |> Enum.join(", ")}\n" end)
    |> IO.puts()

    IO.puts("=====================")
  end

  def parse(input) do
    input
    |> String.split("\r\n\r\n")
    |> Enum.map(fn s -> monkey(s) end)
    |> Enum.with_index()
    |> Map.new(fn {e, i} -> {i, e} end)
  end

  defp monkey(input) do
    r = ~r/Monkey (?<id>\d):
  Starting items: (?<start>.*)
  Operation: new = old (?<op1>.*) (?<op2>.*)
  Test: divisible by (?<test>.\d)
    If true: throw to monkey (?<if_t>.)
    If false: throw to monkey (?<if_f>.)/

    m = Regex.named_captures(r, input)

    %Monkey{
      id: m["id"] |> String.to_integer(),
      items: m["start"] |> String.split(", ") |> Enum.map(fn s -> String.to_integer(s) end),
      operation: op(m["op1"], m["op2"]),
      test_div: m["test"] |> String.to_integer(),
      if_true: m["if_t"] |> String.to_integer(),
      if_false: m["if_f"] |> String.to_integer()
    }
  end

  defp op("*", "old"), do: {"^", 2}
  defp op("+", num), do: {"+", String.to_integer(num)}
  defp op("*", num), do: {"*", String.to_integer(num)}
end
