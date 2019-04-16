require "./lib/enigma_setup"
require "./lib/encryption"
require "./lib/decryption"
require "./lib/cracker"

class Enigma

  def encrypt(message, key = EnigmaSetup.fetch_key, date = EnigmaSetup.fetch_date)
    Encryption.encode(message, key, date)
  end

  def decrypt(message, key, date = EnigmaSetup.fetch_date)
    Decryption.decode(message, key, date)
  end

  def crack(message, date = EnigmaSetup.fetch_date)
    Cracker.crack(message, date)
  end

end
