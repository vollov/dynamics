from django.contrib import admin
from blog.models import Tag, Blog, BlogTag

class BlogAdmin(admin.ModelAdmin):
    list_display = ['id','title', 'created', 'published']   

class TagAdmin(admin.ModelAdmin):
    list_display = ['id','name']   

class BlogTagAdmin(admin.ModelAdmin):
    list_display = ['id','blog', 'tag']  
    
admin.site.register(Blog, BlogAdmin)
admin.site.register(Tag, TagAdmin)
admin.site.register(BlogTag, BlogTagAdmin)

