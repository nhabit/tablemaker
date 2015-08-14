defmodule Tablemaker do

    def main([]) do
      IO.puts("1")

    end

    def print do
        create_data 
        #|>
        #build_table |>
        # print_table
    end

    def create_data() do 
        count = 10
        PrimeMaker.sieve_from(10)
    end


end
