defmodule TablemakerTest do

    use ExSpec, async: true

    def read_test_data do
        {_,test_data} = File.read('test/test_data')
        test_data
    end

    describe "print" do
        it "generates and outputs a multi-line multiplication grid of the first 10 prime numbers" do
            tabledata = Tablemaker.print
            assert tabledata == read_test_data
        end
    end

    describe "create_data" do
        it "returns a list of the first 10 prime numbers" do
            prime_list = Tablemaker.create_data
            assert prime_list == [2,3,5,7,11,13,17,19,23,29]
        end
    end

end
