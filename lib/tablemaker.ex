defmodule Tablemaker do

    def main([]) do
      IO.puts("1")

    end

    def print do
        number_list = create_data
        data_structure = build_tabular_data_structure number_list
        print_table(number_list, data_structure)
    end

    def create_data() do 
        count = 10
        Primemaker.sieve_for(count)
    end

    def build_tabular_data_structure(number_list) do
        Enum.map(number_list, fn(top) -> Enum.map(number_list, fn(side) -> top * side end ) end )
    end

    def print_table(number_list,data_structure) do
        cell_width = widest_number(number_list)
    end

    def widest_number(number_list) do
        Enum.map(number_list, fn(x) -> Integer.to_string(x) end) 
        |> Enum.max_by( fn(x) -> String.length(x) end) 
        |> String.length
    end



end
