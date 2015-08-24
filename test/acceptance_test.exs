defmodule AcceptanceTest do

    use ExSpec, async: true
  
    context "from the command line" do
        
        describe "running the command tablemaker" do
            it "generates a multi-line 10x10 multiplication grid of the first 10 prime numbers" do
                app_name = System.cwd() <> "/tablemaker"
                {tabledata,_} = System.cmd(app_name, [])
                assert tabledata == TestSetupHelper.read_test_data('test/test_data')
            end
        end
    
        describe "running the command tablemaker with the --count option set to 15" do
            it "generates a multi-line 15x15 multiplication grid of the first 15 prime numbers" do
                app_name = System.cwd() <> "/tablemaker"
                {tabledata,_} = System.cmd(app_name, ["--count", "15"])
                assert tabledata == TestSetupHelper.read_test_data('test/test_data_15_prime')
            end
        end

        describe "running the command tablemaker with the --count option set to 15 & --type prime" do
            it "generates a multi-line 15x15 multiplication grid of the first 15 prime numbers" do
                app_name = System.cwd() <> "/tablemaker"
                {tabledata,_} = System.cmd(app_name, ["--type", "prime", "--count", "15"])
                assert tabledata == TestSetupHelper.read_test_data('test/test_data_15_prime')
            end
        end

        describe "running the command tablemaker with paired arguments reversed. count first, type last" do
            it "generates a multi-line 15x15 multiplication grid of the first 15 prime numbers" do
                app_name = System.cwd() <> "/tablemaker"
                {tabledata,_} = System.cmd(app_name, ["--count", "15", "--type", "prime"])
                assert tabledata == TestSetupHelper.read_test_data('test/test_data_15_prime')
            end
        end

        describe "running the command with the --type option set to fib" do
            it "generates a multi-line 10x10 multiplication grid of the first 10 fibonacci numbers" do
                app_name = System.cwd() <> "/tablemaker"
                {tabledata,_} = System.cmd(app_name, ["--type", "fib"])
                assert tabledata == TestSetupHelper.read_test_data('test/test_data_10_fib')
            end
        end

        describe "running the command with the --help option" do
            it "generates a help message" do
                app_name = System.cwd() <> "/tablemaker"
                {help_message,_} = System.cmd(app_name, ["--help"])
                assert help_message == TestSetupHelper.read_test_data('test/help_message')
            end
        end

    end
end