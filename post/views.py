from django.shortcuts import render

from post.models import Tag, Post, PostTag
from rest_framework import viewsets
from post.serializers import PostSerializer, TagSerializer, PostTagSerializer

from dynamics.security import JWTAuthentication
from rest_framework.permissions import IsAuthenticated


class PostViewSet(viewsets.ModelViewSet):
    authentication_classes = (JWTAuthentication,)
    permission_classes = (IsAuthenticated,)

    queryset = Post.objects.all().order_by('-created')
    serializer_class = PostSerializer

class BlogViewSet(viewsets.ViewSet):

    def list(self, request):
        queryset = Post.objects.all().order_by('-created')
        serializer = PostSerializer(queryset, many=True)
        return Response(serializer.data)

class TagViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows Tags to be viewed or edited.
    """
    queryset = Tag.objects.all()
    serializer_class = TagSerializer
    
class PostTagViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows Tags to be viewed or edited.
    """
    queryset = PostTag.objects.all()
    serializer_class = PostTagSerializer
    
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