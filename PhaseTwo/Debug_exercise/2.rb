def encode(plaintext, key)
    cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
    p cipher
    ciphertext_chars = plaintext.chars.map do |char|
        p char
        p cipher.find_index(char).to_i
        p cipher.find_index(char).to_i + 65
        p (65 + cipher.find_index(char).to_i).chr
        (65 + cipher.find_index(char).to_i).chr
    end
    return ciphertext_chars.join
end

def decode(ciphertext, key)
    cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
    p cipher
    plaintext_chars = ciphertext.chars.map do |char|
        cipher[(char.ord - 65)]
    end
    return plaintext_chars.join
end
p encode("theswiftfoxjumpedoverthelazydog", "secretkey")

p decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")