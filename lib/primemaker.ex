defmodule Primemaker do

    def  sieve_for(prime_count) do
        boundry = make_bounds_for(prime_count)
        Enum.to_list(2..boundry) |> sieve_primes([]) |>  Enum.reverse |> Enum.take(prime_count) 
    end

    def make_bounds_for(nth_prime) do
        trunc(nth_prime * :math.log(nth_prime * :math.log(nth_prime)))
    end

    def sieve_primes([] , primes_found), do: primes_found

    def sieve_primes([next_prime | remainder ], primes_found ) do
        remaining_sieve = Enum.reject(remainder, &(rem( &1,  next_prime) == 0))
        sieve_primes(remaining_sieve, [next_prime | primes_found])
    end

    defdelegate find(n), to: __MODULE__, as: :sieve_for 

end