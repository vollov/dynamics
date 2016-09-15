from django.test import TestCase

# Create your tests here.
from app.settings import JWT_SECRET, JWT_SIGN_ALGORITHM

from jose import jwt

from datetime import datetime
from datetime import timedelta

# datetime.timedelta([days[, seconds[, microseconds[, milliseconds[, minutes[, hours[, weeks]]]]]]])

#Time out in 5 minutes
exp_time = datetime.utcnow() + timedelta(minutes=15)

claims = {
            'exp': exp_time,
            'username': 'anna'
        }

encoded = jwt.encode(claims, JWT_SECRET, algorithm=JWT_SIGN_ALGORITHM)
print encoded
x=jwt.decode(encoded, JWT_SECRET, algorithms=JWT_SIGN_ALGORITHM)
print x

# signed = jws.sign({'a': 'b'}, 'secret', algorithm='HS256')
# y = jws.verify(signed, 'secret', algorithms=['HS256'])
# print y