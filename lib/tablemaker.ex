defmodule Tablemaker do

    def main([]) do
      IO.puts("1")

    end

    def print do
        create_data |>
        build_tabular_data_structure
        # print_table
    end

    def create_data() do 
        count = 10
        Primemaker.sieve_for(count)
    end

    def build_tabular_data_structure(number_list) do
        Enum.map(number_list, fn(top) -> Enum.map(number_list, fn(side) -> top * side end ) end )
    end
end
