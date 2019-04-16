require "./test/test_helper"
require "./lib/enigma"

class CrackerTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @message = @enigma.encrypt("hello world end", "08304", "291018")
  end

  def test_it_cracks_with_a_date
    expected = {
      decryption: "hello world end",
      date: "291018",
      key: "08304"
    }
    assert_equal @enigma.crack("vjqtbeaweqihssi", "291018"), expected
  end

  def test_it_cracks_without_a_date
    encrypted = @enigma.encrypt("hello world end")[:encryption]
    expected = {
      decryption: "hello world end",
      date: Date.today.strftime('%d%m%y')
    }
    assert_equal @enigma.crack(encrypted)[:decryption],
    expected[:decryption]
    assert_equal @enigma.crack(encrypted)[:date],
    expected[:date]
  end

end
