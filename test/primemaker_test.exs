defmodule PrimemakerTest do

    use ExSpec, async: true

    describe "find" do
        it "provides a convenience method alias for sieve_for and adds a consistent why of 'finding' irrespecitve of the type" do
            primes = Primemaker.find(10)
            assert primes == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] 
        end
    end


    describe "sieve_for 'n'" do
        it "generates 'n' prime numbers" do
            primes = Primemaker.sieve_for(10)
            assert primes == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] 
        end
    end
  
    context "When n is less than 6" do
        describe "sieve_for n" do
            it "generates the correct number of primes " do
                primes = Primemaker.sieve_for(5)
                assert primes == [2,3,5,7,11]
            end
        end
    end
    
    describe "make_bounds_for 'n'" do
        it "generates the largest number required to create the sieve" do
            assert  31 == Primemaker.make_bounds_for(10)
        end
    end

    describe "sieve_primes" do
        it "returns a list of primes found in the sieve" do
            assert [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31] == Enum.to_list(2..32) |> Primemaker.sieve_primes([]) |> Enum.reverse
        end
    end
end