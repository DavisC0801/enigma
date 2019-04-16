require "./test/test_helper"
require "./lib/encrypt"

class EncryptTest < Minitest::Test

  def test_it_aborts_if_file_not_found
    assert_output('', "Error - input file not found") do
      Encrypt "tests" "tests"
    end
  end

  def test_it_aborts_if_incorrect_number_of_inputs
    assert_output('', "Error - wrong number of inputs") do
      Encrypt "tests" "tests" "tests"
    end
    assert_output('', "Error - wrong number of inputs") do
      Encrypt "tests"
    end
  end

  def test_it_outputs_a_file
    assert_output("Created \"encrypted.txt\" with the key #{/*/} and date #{/*/}", '') do
      Encrypt "message.txt" "encrypted.txt"
    end
  end
end
