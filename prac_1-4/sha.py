import hashlib
string="Gojo"
encoded=string.encode()
result = hashlib.sha256(encoded)
print("String : ", end ="")
print(string)
print("Hash Value : ", end ="")
print(result)
print("Hexadecimal equivalent: ",result.hexdigest())
print("Digest Size : ", end ="")
print(result.digest_size)
print("Block Size : ", end ="")
print(result.block_size)
