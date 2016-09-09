from django.shortcuts import render

from blog.models import Tag, Blog, BlogTag
from rest_framework import viewsets
from blog.serializers import BlogSerializer, TagSerializer, BlogTagSerializer

class BlogViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
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