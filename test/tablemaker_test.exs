defmodule TablemakerTest do

    use ExSpec, async: true
    import ExUnit.CaptureIO

    describe "run" do
        context "with single: false" do
            it "generates and outputs a multi-line multiplication grid of the first 10 prime numbers" do
                tabledata = capture_io fn -> Tablemaker.run([count: 10, type: "prime", single: false]) end
                assert tabledata == TestSetupHelper.read_test_data
            end
        end
        context "with single: true" do
            it "generates and outputs a single number representing the 10th prime number" do
                number = capture_io fn -> Tablemaker.run([count: 10, type: "prime", single: true]) end
                assert number == "29\n"
            end
        end
    end

    describe "create_data" do
        context "with a type of fib and a count of 10 argument" do
            it "returns a list of the first 10 fibonacci numbers" do
                fib_list = Tablemaker.create_data("fib", 10)
                assert fib_list == [0,1,1,2,3,5,8,13,21,34]
            end
        end
        
        context "with a type of prime and a count of 10 argument" do
            it "returns a list of the first 10 prime numbers" do
                fib_list = Tablemaker.create_data("prime", 10)
                assert fib_list == [2,3,5,7,11,13,17,19,23,29]
            end
        end
    end


    describe "module_map" do 
        context "when given the argment 'fib' " do
            it "returns Fibonaccimaker when given 'fib'" do
                assert Fibonaccimaker == Tablemaker.module_map("fib")
            end
        end
    
        context "when given the argument 'prime' " do
            it "returns Primemaker when given 'prime" do
                assert Primemaker == Tablemaker.module_map("prime")
            end
        end
    end

    describe "build_tabular_data_structure" do
        it "creates a multi-dimensional data structure containing calculated data from a list of numbers" do
            table_structure = TestSetupHelper.ten_prime_list() |> Tablemaker.build_tabular_data_structure()
            assert table_structure == TestSetupHelper.ten_prime_data_structure_of_strings()
        end

    end

end
