require "./test/test_helper"
require "./lib/crack"

class CrackTest < Minitest::Test
  def test_it_aborts_if_file_not_found
    assert_output('', "Error - input file not found") do
      Crack "tests" "tests"
    end
  end

  def test_it_aborts_if_incorrect_number_of_inputs
    assert_output('', "Error - wrong number of inputs") do
      Crack "tests" "tests" "tests" "tests"
    end
    assert_output('', "Error - wrong number of inputs") do
      Crack "tests"
    end
  end

  def test_it_outputs_a_file
    assert_output("Created \"cracked.txt\" with the key #{/*/} and date #{/*/}", '') do
      Crack "encrypted.txt" "cracked.txt"
    end
  end
end
