defmodule Tablemaker do

    def main([]) do
      print()

    end

    def print do
        number_list = create_data
        data_structure = build_tabular_data_structure number_list
        print_table_for(:console, number_list, data_structure)
    end

    def create_data() do 
        count = 10
        Primemaker.sieve_for(count)
    end

    def build_tabular_data_structure(number_list) do
        Enum.map(number_list, fn(top) -> Enum.map(number_list, fn(side) -> Integer.to_string(top * side) end ) end ) 
    end

    def print_table_for(:console, number_list, data_structure) do
        ConsolePrinter.print_table(number_list, data_structure)
    end

    def print_table_for(device, number_list, data_structure) do
        IO.puts "I have ZERO idea what #{device} is. sorry!"
    end

end
