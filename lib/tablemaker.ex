defmodule Tablemaker do

    def main(args) do
      args |> parse_args |> run

    end

    def parse_args(args) do
        {options, _, _} = OptionParser.parse(args,
            switches: [count: :Integer, type: :string]
        )
         
        case options do
            [type: "prime", count: count]   -> ([count: count, type: "prime"])
            [type: "fib", count: count]     -> ([count: count, type: "fib"])
            [type: type ]                   -> ([count: "10", type: type])
            [count: count ]                 -> ([count: count, type: "prime"])
            []                              -> ([count: "10", type: "prime"])
            _                               -> :help
        end

#        options
    end


    def run([count: count, type: type ]) do
        number_list = create_data(type, String.to_integer(count) )
        data_structure = build_tabular_data_structure number_list
        print_table_for(:console, number_list, data_structure)
    end

    def run(:help) do
        IO.puts "You need help??"
        IO.puts "Current options are --count n --type prime/fib"
    end

    def create_data("prime", count) do 
        Primemaker.sieve_for(count)
    end

    def create_data("fib", count) do
        Fibonaccimaker.find(count)
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
