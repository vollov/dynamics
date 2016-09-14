from django.shortcuts import render

from blog.models import Tag, Blog, BlogTag
from rest_framework import viewsets
from blog.serializers import BlogSerializer, TagSerializer, BlogTagSerializer

from dynamics.security import JWTAuthentication
from rest_framework.permissions import IsAuthenticated

class BlogViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    authentication_classes = (JWTAuthentication,)
    permission_classes = (IsAuthenticated,)
    
    queryset = Blog.objects.all().order_by('-created')
    serializer_class = BlogSerializer
    # permission_classes = (permissions.IsAuthenticatedOrReadOnly,)

class TagViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows Tags to be viewed or edited.
    """
    queryset = Tag.objects.all()
    serializer_class = TagSerializer
    
class BlogTagViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows Tags to be viewed or edited.
    """
    queryset = BlogTag.objects.all()
    serializer_class = BlogTagSerializer
    
from rest_framework.response import Response
from rest_framework.views import APIView

class ExampleView(APIView):
    authentication_classes = (JWTAuthentication,)
    permission_classes = (IsAuthenticated,)
    #permission_classes = (permissions.IsAuthenticatedOrReadOnly,)

    def get(self, request, format=None):
        content = {
            'user': 'martin_test',  # `django.contrib.auth.User` instance.
            'auth': 'str_auth',  # None
        }
        return Response(content)