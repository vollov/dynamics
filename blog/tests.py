from django.test import TestCase

# Create your tests here.


from jose import jwt
encoded = jwt.encode({'some': 'payload'}, 'secretxx', algorithm='HS256')
print encoded
x=jwt.decode(encoded, 'secretxx', algorithms=['HS256'])
print x

# signed = jws.sign({'a': 'b'}, 'secret', algorithm='HS256')
# y = jws.verify(signed, 'secret', algorithms=['HS256'])
# print y