defmodule FibonaccimakerTest do

    use ExSpec, async: true

    describe "find 'n'" do
        it "generates 'n' Fibonacci numbers" do
            fibs = Fibonacci.find(10)
            assert fibs == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34] 
        end
    end
end