defmodule Fibonaccimaker do

    def  find(fib_count) do
        fib = Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end )
        fib |> Enum.take(fib_count)
    end

end