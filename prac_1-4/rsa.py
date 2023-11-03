import math
def is_prime(num):
    if num <= 1:
        return False
    for i in range(2, int(math.sqrt(num)) + 1):
        if num % i == 0:
            return False
    return True


def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

def mod_inverse(e, phi):
    d = 0
    x1 = 0
    x2 = 1
    y1 = 1
    temp_phi = phi
    
    while e > 0:
        temp1 = temp_phi // e
        temp2 = temp_phi - temp1 * e
        temp_phi = e
        e = temp2
        x = x2 - temp1 * x1
        y = d - temp1 * y1
        x2 = x1
        x1 = x
        d = y1
        y1 = y
        

    if temp_phi == 1:
        return d + phi

def generate_keypair(p, q):
    if not (is_prime(p) and is_prime(q)):
        raise ValueError("Both numbers must be prime.")
    elif p == q:
        raise ValueError("p and q cannot be equal.")
    n = p * q
    phi = (p - 1) * (q - 1)
    e = 2

    while e < phi and gcd(e, phi) != 1:
        e += 1
    d = mod_inverse(e, phi)
    return ((e, n), (d, n))

def encrypt(public_key, plaintext):
    e, n = public_key
    encrypted = [pow(ord(char), e, n) for char in plaintext]
    return encrypted

def decrypt(private_key, ciphertext):
    d, n = private_key
    decrypted = [chr(pow(char, d, n)) for char in ciphertext]
    return ''.join(decrypted)


if __name__ == "__main__":
    p = int(input("Enter a prime number (p): "))
    q = int(input("Enter another prime number (q): "))
    public_key, private_key = generate_keypair(p, q)
    message = input("Enter a message to encrypt: ")
    encrypted_message = encrypt(public_key, message)
    print("Encrypted message:", encrypted_message)
    decrypted_message = decrypt(private_key, encrypted_message)
    print("Decrypted message:", decrypted_message)
