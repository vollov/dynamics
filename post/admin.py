from django.contrib import admin
from post.models import Tag, Post, PostTag

class PostAdmin(admin.ModelAdmin):
    list_display = ['id','title', 'created', 'published']  
    prepopulated_fields = {"slug": ("title",)} 

class TagAdmin(admin.ModelAdmin):
    list_display = ['id','name']   

class PostTagAdmin(admin.ModelAdmin):
    list_display = ['id','post', 'tag']  
    
admin.site.register(Post, PostAdmin)
admin.site.register(Tag, TagAdmin)
admin.site.register(PostTag, PostTagAdmin)

