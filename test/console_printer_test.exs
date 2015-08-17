defmodule ConsolePrinterTest do
    use ExSpec, async: true
    import ExUnit.CaptureIO


    describe "widest_number" do
        it "finds and returns the length of the number whose string length is largest" do
            number_list = ["1","45","9000","23","58","444"]
            widest = ConsolePrinter.widest_number(number_list)
            assert widest == 4
        end
    end

    describe "print_table" do
        it "outputs a multidimensional data structure as an ascii tabledata" do
            prime_list = TestSetupHelper.ten_prime_list()
            data_structure = TestSetupHelper.ten_prime_data_structure_of_strings()
            table =  capture_io fn -> ConsolePrinter.print_table(prime_list,data_structure) end
            assert table == TestSetupHelper.read_test_data
        end
    end

end
