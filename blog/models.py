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
    
class Blog(models.Model):
    id = models.CharField(max_length=64, primary_key=True, verbose_name=u"Activation key",
                 default=uuid.uuid4)
    
    title = models.CharField(max_length=60, blank=False, null=False)
    content = models.TextField(blank=False, null=False)
    
    tags = models.ManyToManyField(Tag, related_name='tags', through='BlogTag')
    
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    published = models.BooleanField(default=True)
    
    def __unicode__(self):
        return self.title
    
class BlogTag(models.Model):
    """
    blog and tag many to many relationship joint table
    """
    id = models.CharField(max_length=64, primary_key=True, verbose_name=u"Activation key",
                           default=uuid.uuid4)
    
    blog = models.ForeignKey('Blog')
    tag = models.ForeignKey('Tag')
    
    
    def __unicode__(self):
        return self.blog.title + '_' + self.tag.name
    