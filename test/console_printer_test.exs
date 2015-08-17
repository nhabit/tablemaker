defmodule ConsolePrinterTest do
    use ExSpec, async: true
    import ExUnit.CaptureIO

    def read_test_data do
        {_,test_data} = File.read('test/test_data')
        test_data
    end
    
    def ten_prime_data_structure do
        [[4,6,10,14,22,26,34,38,46,58,],
        [6,9,15,21,33,39,51,57,69,87,],
        [10,15,25,35,55,65,85,95,115,145,],
        [14,21,35,49,77,91,119,133,161,203,],
        [22,33,55,77,121,143,187,209,253,319,],
        [26,39,65,91,143,169,221,247,299,377,],
        [34,51,85,119,187,221,289,323,391,493,],
        [38,57,95,133,209,247,323,361,437,551,],
        [46,69,115,161,253,299,391,437,529,667,],
        [58,87,145,203,319,377,493,551,667,841,]]
    end

    def ten_prime_data_structure_of_strings do
        [["4","6","10","14","22","26","34","38","46","58",],
        ["6","9","15","21","33","39","51","57","69","87",],
        ["10","15","25","35","55","65","85","95","115","145",],
        ["14","21","35","49","77","91","119","133","161","203",],
        ["22","33","55","77","121","143","187","209","253","319",],
        ["26","39","65","91","143","169","221","247","299","377",],
        ["34","51","85","119","187","221","289","323","391","493",],
        ["38","57","95","133","209","247","323","361","437","551",],
        ["46","69","115","161","253","299","391","437","529","667",],
        ["58","87","145","203","319","377","493","551","667","841",]]
    end
    
    def ten_prime_list do
        [2,3,5,7,11,13,17,19,23,29]
    end
    describe "widest_number" do
        it "finds and returns the length of the number whose string length is largest" do
            number_list = ["1","45","9000","23","58","444"]
            widest = ConsolePrinter.widest_number(number_list)
            assert widest == 4
        end
    end

    describe "print_table" do
        it "outputs a multidimensional data structure as an ascii tabledata" do
            prime_list = ten_prime_list()
            data_structure = ten_prime_data_structure_of_strings()
            table =  capture_io fn -> ConsolePrinter.print_table(prime_list,data_structure) end
            assert table == read_test_data
        end
    end

end
