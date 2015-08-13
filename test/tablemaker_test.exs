defmodule TablemakerTest do

    use ExSpec, async: true

    def read_test_data do
        {_,test_data} = File.read('test/test_data')
        test_data
    end
  
end
