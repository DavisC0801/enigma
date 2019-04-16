require "./lib/enigma_setup"

class Decryption
  include EnigmaSetup

  def self.decode(message, key, date)
    encode = EnigmaSetup.shift(message, key, date, "de")
    EnigmaSetup.create_hash(encode, key, date, :decryption)
  end

end
