from blog.models import Tag, Blog, BlogTag
from rest_framework import serializers

class TagSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Tag
        fields = ('id', 'name')
        
class BlogSerializer(serializers.HyperlinkedModelSerializer):
    tags = TagSerializer(read_only=False, many=True)
    
    class Meta:
        model = Blog
        fields = ('id', 'title', 'content', 'tags')

class BlogTagSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = BlogTag
        fields = ('id', 'tag', 'blog')