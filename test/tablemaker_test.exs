defmodule TablemakerTest do

    use ExSpec, async: true

    def read_test_data do
        {_,test_data} = File.read('test/test_data')
        test_data
    end
  
    context "from the command line" do
        describe "running the command tablemaker" do
            it "generates a multi-line 10x10 multiplication grid of the first 10 prime numbers" do
                {tabledata,_} = System.cmd("tablemaker", [])
                assert tabledata == read_test_data
            end
        end
    end
    
end
