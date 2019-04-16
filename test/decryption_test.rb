require "./test/test_helper"
require "./lib/enigma"

class DecryptionTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @decrypt = @enigma.decrypt("keder ohulw!", "02715", "040895")
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

end
