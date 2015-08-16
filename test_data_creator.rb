class Bing 

    def Bing.print_multiplication_table

        ten_primes = [2,3,5,7,11,13,17,19,23,29]
        top_line = "-------" * 12 << "-----"
        separator_line =  "|-------" << ("+-------" * 10) << "|"
        puts top_line
        row = "#{printf("|%7s|", " ")} "
        (ten_primes).each do |header|
            row = row << "#{printf("  %3d  |", header)}"
        end

        puts row
        ( ten_primes ).each do | top |
            puts separator_line
            row = "#{printf("|  %3d  |", top )}"
            ( ten_primes ).each do | side |
                row = row << " #{printf("  %3d  |", top * side)}"
            end
            puts row
        end
        puts top_line
        
    end 
end

Bing.print_multiplication_table
