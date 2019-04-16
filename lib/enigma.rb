class Enigma

  def encrypt(message, key = fetch_key, date = fetch_date)
    Encryption.encode(message, key, date)
  end

  def decrypt(message, key, date = fetch_date)
    Decryption.decode(message, key, date)
  end

  def crack(message, date = fetch_date)
    Cracker.crack(message, date)
  end

end
