require "./test/test_helper"
require "./lib/encryption"

class EncryptTest < Minitest::Test

  def setup
    @encrypt = Encryption.encode("hello world")
  end

  def test_it_accepts_a_date
    encrypt_date = Encryption.encode("hello world", "12345", "080196")
    assert_equal encrypt_date[:date], "080196"
  end

  def test_it_accepts_a_key
    encrypt_key = Encryption.encode("hello world", "12345")
    assert_equal encrypt_key[:key], "12345"
  end

  def test_it_has_default_values
    assert_equal @encrypt[:date], Date.today.strftime('%d%m%y')
    assert (1..99999).to_a.include?(@encrypt[:key].to_i)
  end

  def test_setup_values
    encrypt_setup = Encryption.setup("12345", "080196")
    assert_equal encrypt_setup[:base], Enigma.generate_characters()
    assert_equal encrypt_setup[:keys], [20, 27, 35, 51]
  end

  def test_it_encrypts_message
    encrypt_message = Encryption.encode("hello world!", "02715", "040895")
    assert_equal encrypt_message[:encryption], "keder ohulw!"
  end

end