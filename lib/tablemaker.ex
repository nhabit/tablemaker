defmodule Tablemaker do

    def main(args) do
      args |> parse_args |> print

    end

    defp parse_args(args) do
        {options, _, _} = OptionParser.parse(args,
            switches: [count: :number]
        )
        options
    end

    def print([]) do
        number_list = create_data()
        data_structure = build_tabular_data_structure number_list
        print_table_for(:console, number_list, data_structure)
    end

    def print([count: number]) do
        count = String.to_integer(number)
        number_list = create_data(count)
        data_structure = build_tabular_data_structure number_list
        print_table_for(:console, number_list, data_structure)
    end

    def create_data(count \\ 10) do 
        Primemaker.sieve_for(count)
    end

    def build_tabular_data_structure(number_list) do
        Enum.map(number_list, fn(top) -> Enum.map(number_list, fn(side) -> Integer.to_string(top * side) end ) end ) 
    end

    def print_table_for(:console, number_list, data_structure) do
        ConsolePrinter.print_table(number_list, data_structure)
    end

    def print_table_for(device, _, _) do
        IO.puts "I have ZERO idea what #{device} is. sorry!"
    end

end
