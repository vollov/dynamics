from __future__ import unicode_literals

from django.db import models
import uuid

class Tag(models.Model):
    """
    Tags to classify blog contents
    """
    id = models.CharField(max_length=64, primary_key=True, verbose_name=u"Activation key",
                 default=uuid.uuid4)
    
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    published = models.BooleanField(default=True)
    
    name = models.CharField(max_length=60,unique=True, blank=False, null=False)
    
    def __unicode__(self):
        return self.name
    
class Post(models.Model):
    id = models.CharField(max_length=64, primary_key=True, verbose_name=u"Activation key",
                 default=uuid.uuid4)
    
    title = models.CharField(max_length=60, blank=False, null=False)
    slug = models.SlugField(max_length=60, unique=True) # ,  blank=True, null=True

    abstract = models.TextField(blank=False, null=False)
    content = models.TextField(blank=False, null=False)
    
    tags = models.ManyToManyField(Tag, related_name='tags', through='PostTag')
    
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    published = models.BooleanField(default=True)
    
    def __unicode__(self):
        return self.title
    
class PostTag(models.Model):
    """
    blog and tag many to many relationship joint table
    """
    id = models.CharField(max_length=64, primary_key=True, verbose_name=u"Activation key",
                           default=uuid.uuid4)
    
    post = models.ForeignKey('Post')
    tag = models.ForeignKey('Tag')
    
    
    def __unicode__(self):
        return self.post.title + '_' + self.tag.name
    