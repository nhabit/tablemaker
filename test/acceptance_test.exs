defmodule AcceptanceTest do

    use ExSpec, async: true
  
    context "from the command line" do
        
        describe "running the command tablemaker" do
            it "generates a multi-line 10x10 multiplication grid of the first 10 prime numbers" do
                app_name = "/Users/andy/projects/elixir-stuff/tablemaker/tablemaker"
                {tabledata,_} = System.cmd(app_name, [])
                assert tabledata == TestSetupHelper.read_test_data('test/test_data')
            end
        end
    
        describe "running the command tablemaker with the --count option set to 15" do
            it "generates a multi-line 15x15 multiplication grid of the first 15 prime numbers" do
                app_name = "/Users/andy/projects/elixir-stuff/tablemaker/tablemaker"
                {tabledata,_} = System.cmd(app_name, ["--count", "15"])
                assert tabledata == TestSetupHelper.read_test_data('test/test_data_15_prime')
            end
        end

    end
end