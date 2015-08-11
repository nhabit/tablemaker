defmodule TablemakerTest do

  use ExSpec, async: true

  def read_test_data do
    {_,test_data} = File.read('test/test_data')
  end

  describe "running the command tablemaker" do
      it "generates a multilne 10x10 multiplication grid of the first 10 prime numbers" do
          {name,_} = System.cmd("tablemaker", [])
          assert name == read_test_data
      end
  end



end
