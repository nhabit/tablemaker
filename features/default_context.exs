defmodule WhiteBread.Tablemaker.DefaultContext do
  
  use WhiteBread.Context
  subcontext WhiteBread.Tablemaker.RunContext

feature_starting_state fn  ->
    %{feature_state_loaded: :yes}
  end

  scenario_starting_state fn feature_state ->
    feature_state |> Dict.put(:starting_state_loaded, :yes)
  end

end


defmodule WhiteBread.Tablemaker.RunContext do
  use WhiteBread.Context

  given_ ~r/^that I have a tablemaker executable$/, fn _state ->
    {name,_} = System.cmd("which", ["tablemaker"])
    assert name = "./tablemaker\n" 
  end

  

end

defmodule WhiteBread.Tablemaker.DefaultContext.Testdata do
  import WhiteBread.Helpers

 
  def read_test_data do
    {_,test_data} = File.read('features//prime_test_data.txt')
    test_data 
  end

end