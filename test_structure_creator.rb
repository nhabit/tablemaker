class Bing 

    def Bing.print_multiplication_structure

        ten_primes = [2,3,5,7,11,13,17,19,23,29]
        ( ten_primes ).each do | top |
            row = "["
            ( ten_primes ).each do | side |
                row = row << "#{ top * side},"
            end
            row = row << "],"
            puts row
        end
        puts "]"
    end 
end

Bing.print_multiplication_structure