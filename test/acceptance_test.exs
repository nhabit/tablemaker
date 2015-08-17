defmodule AcceptanceTest do

    use ExSpec, async: true
  
    context "from the command line" do
        describe "running the command tablemaker" do
            it "generates a multi-line 10x10 multiplication grid of the first 10 prime numbers" do
                app_name = "/Users/andy/projects/elixir-stuff/tablemaker/tablemaker"
                {tabledata,_} = System.cmd(app_name, [])
                assert tabledata == TestSetupHelper.read_test_data()
            end
        end
    end
end