from post.models import Tag, Post, PostTag
from rest_framework import serializers

class TagSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Tag
        fields = ('id', 'name')
        
class PostSerializer(serializers.HyperlinkedModelSerializer):
    tags = TagSerializer(read_only=False, many=True)
    
    class Meta:
        model = Post
        fields = ('id', 'title', 'created', 'content', 'tags', 'abstract', 'slug')

class PostTagSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = PostTag
        fields = ('id', 'tag', 'post')