require "./test/test_helper"
require "./lib/decrypt"

class DecryptTest < Minitest::Test

  def setup
    @decrypt = Decrypt.decode("keder ohulw!", "02715", "040895")
  end

  def test_it_accepts_a_date
    assert_equal @decrypt[:date], "040895"
  end

  def test_it_accepts_a_key
    assert_equal @decrypt[:key], "02715"
  end

  def test_it_decrypts_message
    assert_equal @decrypt[:decryption], "hello world!"
  end

  def test_setup_values
    decrypt_setup = Decrypt.setup("12345", "080196")
    assert_equal decrypt_setup[:base], Enigma.generate_characters()
    assert_equal decrypt_setup[:keys], [20, 27, 35, 51]
  end

end
