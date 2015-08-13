defmodule TablemakerTest do

    use ExSpec, async: true

    def read_test_data do
        {_,test_data} = File.read('test/test_data')
        test_data
    end

    describe "print_table" do
        it "generates a multi-line 10x10 multiplication grid of the first 10 prime numbers" do
            tabledata = Tablemaker.print_table
            assert tabledata == read_test_data
        end
    end

end
