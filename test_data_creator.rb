class Bing 

    def Bing.print_multiplication_table

        ten_primes = [2,3,5,7,11,13,17,19,23,29]
        top_line = "---------" * 11
        separator_line = "--------|" * 11
        left_gap = " " * 4
        puts " "
        puts left_gap + top_line
        row = "#{left_gap}#{printf("    |%7s|", " ")} "
        (ten_primes).each do |header|
            row = row << "#{printf("%4d    |", header)}"
        end

        puts row
        puts left_gap + separator_line
        ( ten_primes ).each do | top |
            row = "#{left_gap}#{printf("    |%4d   |", top )}"
            ( ten_primes ).each do | side |
                row = row << " #{printf("%4d    |", top * side)}"
            end
            puts row
            puts left_gap + separator_line
        end
        puts row
    end 
end

Bing.print_multiplication_table
