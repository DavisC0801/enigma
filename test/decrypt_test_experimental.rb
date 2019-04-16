require "./test/test_helper"
require "./lib/decrypt"

class DecryptTest < Minitest::Test

  def test_it_aborts_if_file_not_found
    assert_output('', "Error - input file not found") do
      Decrypt "tests" "tests" "tests" "tests"
    end
  end

  def test_it_aborts_if_incorrect_number_of_inputs
    assert_output('', "Error - wrong number of inputs") do
      Decrypt "tests" "tests" "tests" "tests" "tests"
    end
    assert_output('', "Error - wrong number of inputs") do
      Decrypt "tests" "tests"
    end
  end

  def test_it_outputs_a_file
    assert_output("Created \"decrypted.txt\" with the key #{/*/} and date #{/*/}", '') do
      Decrypt "encrypted.txt" "decrypted.txt" 83132 160419
    end
  end
end
