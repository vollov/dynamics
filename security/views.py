from django.shortcuts import render

from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from security.serializers import UserSerializer, GroupSerializer

from dynamics.security import JWTAuthentication
from rest_framework.permissions import IsAuthenticated

class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    authentication_classes = (JWTAuthentication,)
    permission_classes = (IsAuthenticated,)

    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    # permission_classes = (permissions.IsAuthenticatedOrReadOnly,)

class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.contrib.auth import authenticate
from jose import jwt
from app.settings import JWT_SECRET, JWT_SIGN_ALGORITHM, JWT_EXPIRE_IN_MINUTE

import logging, json
logger = logging.getLogger(__name__)

from datetime import datetime
from datetime import timedelta

@api_view(['POST'])
def login(request):
    """
    return a token if user is authenticated
    """

    if request.method == 'POST':
        # request.data is a dictionary 
        username = request.data.get('username')
        password = request.data.get('password')

        logger.debug('getting request user={0}, request.body={1}'.format(username, request.data))
        
        user = authenticate(username=username, password=password)
         
        if user:
            if user.is_active:
                logger.debug('user active, login() {0}, {1}'.format(request, user))
                # return json token
                exp_time = datetime.utcnow() + timedelta(minutes=JWT_EXPIRE_IN_MINUTE)
                payload = {'exp':exp_time, 'username': username}
                
                token = jwt.encode(payload, JWT_SECRET, algorithm=JWT_SIGN_ALGORITHM)
                return Response({'token': token }, status=status.HTTP_200_OK)
            else:
                return Response({'error':'user has been disabled' }, status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response({'error':'user name and password does not match' }, status=status.HTTP_401_UNAUTHORIZED)
                
    else:
        return Response({'error':'login with HTTP POST only' }, status=status.HTTP_400_BAD_REQUEST)