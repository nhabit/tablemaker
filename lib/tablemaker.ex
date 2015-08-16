defmodule Tablemaker do

    def main([]) do
      print()

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
        pad = 4
        number_width =  Enum.map(data_structure, &Tablemaker.widest_number(&1)) |> Enum.max 
        number_list = Enum.map(number_list, fn(x) -> Integer.to_string(x) end) 
        print_table_border_line(number_list,number_width, pad)
        print_table_header(number_list,number_width)
        print_body(number_list, data_structure, number_width, pad)
        print_table_border_line(number_list,number_width, pad)
    end

    
    def widest_number(number_list) do
        Enum.map(number_list, fn(x) -> Integer.to_string(x) end) 
        |> Enum.max_by( fn(x) -> String.length(x) end) 
        |> String.length
    end

    defp print_table_header( number_list, number_width) do
        "|       |  " <> Enum.map_join( number_list, "|  ", fn _ -> "~#{number_width}s  " end) <> "|~n" |> :io.format(number_list)
    end
    
    defp print_table_border_line(number_list, number_width, pad) do   
        table_cells_per_row = length(number_list) + 1
        cell_width = number_width + pad 
        cell_line = String.duplicate "-", cell_width
        IO.puts "-" <> Enum.join((List.duplicate(cell_line, table_cells_per_row)), "-") <> "-"
    end

    defp print_body([head|remainder],[ds_head|ds_remainder], number_width, pad) do
        cell_count = length([head|ds_head])
        top_line = String.duplicate "-", (number_width + pad)
        IO.puts horizontal_separator(top_line, cell_count)
        ds_string_list = Enum.map(ds_head, fn(x) -> Integer.to_string(x) end) 
        "|  " <> Enum.map_join( [head|ds_string_list], "|  ", fn _ -> "~#{number_width}s  " end) <> "|~n" |> :io.format([head|ds_string_list])
        print_body(remainder,ds_remainder, number_width, pad)
    end

    defp horizontal_separator(line,count) do
        "|" <> Enum.join((List.duplicate(line, count)), "+") <> "|"
    end


    defp print_body([], [], _, _) do end

end
