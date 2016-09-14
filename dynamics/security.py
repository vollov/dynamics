from rest_framework import authentication
from rest_framework import exceptions
from jose import jwt
from jose.exceptions import JWTError
from django.contrib.auth.models import User

from app.settings import JWT_SECRET, JWT_SIGN_ALGORITHM

import logging
logger = logging.getLogger(__name__)

class JWTAuthentication(authentication.BaseAuthentication):
    """
    authenticate the user via authentication token
    """
    def authenticate(self, request):
        token = request.META.get('HTTP_JWT')
        logger.debug("entering JWTAuthentication.authenticate() request = {0}".format(token))
        
        if not token:
            return None
        else:
            print token

        try:
            payload = jwt.decode(token, JWT_SECRET, algorithms=JWT_SIGN_ALGORITHM)
        except JWTError:
            raise exceptions.AuthenticationFailed('JWT decode error')
        
        print 'payload= {0}'.format(payload)
        
        try:    
            user = User.objects.get(username=payload.get('username', None))
        except User.DoesNotExist:
            raise exceptions.AuthenticationFailed('No such user')

        return (user, None)