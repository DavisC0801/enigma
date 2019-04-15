require "./test/test_helper"
require "./lib/decrypt"

class DecryptTest < Minitest::Test
  
    def setup
      @encrypt = Decrypt.decode("keder ohulw!", "02715", "040895")
    end

    def test_it_accepts_a_date
      assert_equal @decrypt[:date], "040895"
    end

    def test_it_accepts_a_key
      assert_equal @decrypt[:key], "02715"
    end

    def test_it_decrypts_message
      @decrypt = Decrypt.decode("hello world!", "02715", "040895")
      assert_equal @decrypt[:decryption], "hello world!"
    end

end
