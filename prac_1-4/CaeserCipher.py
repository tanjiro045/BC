def encrypt(text, shift):
    encrypted_text = ""
    for char in text:
        if char.isalpha():
            if char.islower():
                encrypted_char = chr((ord(char) - ord('a' ) + shift) % 26 + ord('a'))
            else:
                encrypted_char = chr((ord(char) - ord('A' ) + shift) % 26 + ord('A'))
        else:
            encrypted_char = char
        encrypted_text += encrypted_char
    return encrypted_text

def decrypt(encrypted_text, shift):
    decrypted_text = ""
    for char in encrypted_text:
        if char.isalpha():
            if char.islower():
                decrypted_char = chr((ord(char) - ord('a' ) - shift) % 26 + ord('a'))
            else:
                decrypted_char = chr((ord(char) - ord('A' ) - shift) % 26 + ord('A'))
        else:
            decrypted_char = char
        decrypted_text += decrypted_char
    return decrypted_text


# Example usage
plaintext = input("enter plain text: ")
shift = int(input("Enter Shift Value: "))
encrypted_text = encrypt(plaintext, shift)
decrypted_text = decrypt(encrypted_text, shift)
print("Original Text:", plaintext)
print("Encrypted Text:", encrypted_text)
print("Decrypted Text:", decrypted_text)
