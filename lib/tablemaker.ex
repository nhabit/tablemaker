defmodule Tablemaker do

    def main(args) do
      args |> parse_args |> run

    end

    def parse_args(args) do
        options = OptionParser.parse(args,
            switches: [count: :integer, type: :string, help: :boolean],
            aliases: [h: :help]
        )
         
        default_args = %{ :count => 10, :type  => "prime" }
        case options do
            { [help: :true ], _, _}    -> :help
            { opts, _, _ }       -> Enum.into(opts,default_args)
        end
    end


    def run(:help) do
        IO.puts "You need help??"
        IO.puts "Current options are --count n --type prime/fib"
    end
    
    def run(options) do
        number_list = create_data(options[:type], options[:count] )
        data_structure = build_tabular_data_structure number_list
        print_table_for(:console, number_list, data_structure)
    end



    def create_data(type, count) do 
        module_map(type).find(count)
    end

    def module_map(type) do
        map = %{"prime" => Primemaker, "fib" => Fibonaccimaker}
        map[type]
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
