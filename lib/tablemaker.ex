defmodule Tablemaker do

    def main(args) do
      args |> parse_args |> run

    end

    defp parse_args(args) do
        {options, _, _} = OptionParser.parse(args,
            switches: [count: :number, type: :string]
        )
        case options do
            {[count: count] ,_ ,_ } -> [:count, String.to_int(count), :type, 'prime']
            {[type: type ] ,_ ,_ } -> [:count, 10, :type, type]
            {[count: count, type: type],_,_} -> [:count, String.to_int(count), :type, type]
            _ -> :help
        end

        options
    end


    def run([:type, type, :count, count ]) do
        number_list = create_data(type, count )
        data_structure = build_tabular_data_structure number_list
        print_table_for(:console, number_list, data_structure)
    end


    def run(:help) do
        IO.puts "You need help??"
    end

    def run([]) do
        number_list = create_data()
        data_structure = build_tabular_data_structure number_list
        print_table_for(:console, number_list, data_structure)
    end


    def create_data('prime', count) do 
        Primemaker.sieve_for(count)
    end

    def create_data('fib', count ) do
        Fibonaccimaker.find(count)
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
