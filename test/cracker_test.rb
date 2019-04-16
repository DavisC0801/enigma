require "./test/test_helper"
require "./lib/cracker"
require "./lib/encryption"

class CrackerTest < Minitest::Test

  def setup
    @message = Encryption.encode("hello world end", "08304", "291018")
  end

  def test_it_cracks_with_a_date
    expected = {
      decryption: "hello world end",
      date: "291018",
      key: "08304"
    }
    assert_equal Cracker.crack("vjqtbeaweqihssi", "291018"), expected
  end

  def test_it_cracks_without_a_date
    expected = {
      decryption: "hello world end",
      date: Date.today.strftime('%d%m%y')
    }
    assert_equal Cracker.crack("vjqtbeaweqihssi")[:decryption],
    expected[:decryption]
    assert_equal Cracker.crack("vjqtbeaweqihssi")[:date],
    expected[:date]
  end

end
