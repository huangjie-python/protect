from django.contrib import admin

from .models import *

# Register your models here.



@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    search_fields = ['name']
    list_per_page = 10
    list_display = ['id', 'new_type', 'name', 'author', 'time']


@admin.register(Author)
class NewsAdmin(admin.ModelAdmin):
    search_fields = ['name']
    list_per_page = 10
    list_display = ['id', 'name', 'gender', 'age']


    def gender(self):
        if self.gender:
            return '男'
        else:
            return '女'

@admin.register(New_types)
class New_typeAdmin(admin.ModelAdmin):
    search_fields = ['type']
    list_per_page = 10
    list_display = ['id', 'type', 'is_delete']


@admin.register(Users)
class UserAdmin(admin.ModelAdmin):
    def ugender(self):
        if self.gender:
            return '男'
        else:
            return '女'


@admin.register(Comment)
class Comment(admin.ModelAdmin):
    list_display = ['new', 'user', 'time']
    list_per_page = 10