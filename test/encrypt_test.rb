require "./test/test_helper"
require "./lib/encrypt"

class EncryptTest < Minitest::Test

  def setup
    @encrypt = Encrypt.encode("hello world")
  end

  def test_it_accepts_a_date
    encrypt_date = Encrypt.encode("hello world", "12345", "080196")
    assert_equal encrypt_date[:date], "080196"
  end

  def test_it_accepts_a_key
    encrypt_key = Encrypt.encode("hello world", "12345")
    assert_equal encrypt_key[:key], "12345"
  end

  def test_it_has_default_values
    d = Date.today
    assert_equal @encrypt[:date], d.strftime('%d%m%y')
    assert (1..99999).to_a.include?(@encrypt[:key].to_i)
  end

  def test_it_encrypts_message
    encrypt_message = Encrypt.encode("hello world", "02715", "040895")
    assert_equal encrypt_message[:encryption], "keder ohulw"
  end

end
