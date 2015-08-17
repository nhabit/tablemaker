defmodule ConsolePrinter do
    
    def print_table(number_list,data_structure) do
        pad = 4
        number_width =  Enum.map(data_structure, &ConsolePrinter.widest_number(&1)) |> Enum.max 
        number_list = Enum.map(number_list, fn(x) -> Integer.to_string(x) end) 
        print_table_border_line(number_list,(number_width + pad))
        print_table_header(number_list,number_width, pad)
        print_body(number_list, data_structure, number_width, pad)
        print_table_border_line(number_list, (number_width +  pad))
    end

    
    def widest_number(list) do
        Enum.max_by( list, fn(x) -> String.length(x) end) |> String.length
    end

    defp print_table_header( number_list, number_width, pad) do
        blank_cell = "|" <> String.duplicate(" ", (number_width + pad)) <> "|  "
        blank_cell <> Enum.map_join( number_list, "|  ", fn _ -> "~#{number_width}s  " end) <> "|~n" |> :io.format(number_list)
    end
    
    defp print_table_border_line(list, cell_width ) do   
        cell_count = length(list) + 1
        cell_line = String.duplicate("-", cell_width)
        IO.puts "-" <> Enum.join((List.duplicate(cell_line, cell_count)), "-") <> "-"
    end

    defp print_body([head|remainder],[ds_head|ds_remainder], number_width, pad) do
        cell_count = length([head|ds_head])
        top_line = String.duplicate "-", (number_width + pad)
        IO.puts horizontal_separator(top_line, cell_count)
        "|  " <> Enum.map_join( [head|ds_head], "|  ", fn _ -> "~#{number_width}s  " end) <> "|~n" |> :io.format([head|ds_head])
        print_body(remainder,ds_remainder, number_width, pad)
    end

    defp print_body([], [], _, _) do end

    defp horizontal_separator(line,count) do
        "|" <> Enum.join((List.duplicate(line, count)), "+") <> "|"
    end

end