from django.db import models
import datetime
from ckeditor.fields import RichTextField
# Create your models here.

class News(models.Model):
    name = models.CharField(max_length=100)
    content = RichTextField()
    time = models.DateField(max_length=20, default=datetime.datetime.now().strftime('%Y-%m-%d'))
    read_num = models.IntegerField( default=0)
    comment_num = models.IntegerField( default=0)
    img = models.CharField(max_length=100)
    is_delete = models.BooleanField(max_length=10, default=False)
    new_type = models.ForeignKey('New_types',on_delete=models.CASCADE)
    author = models.ForeignKey('Author', on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class New_types(models.Model):
    type = models.CharField(max_length=20)
    is_delete = models.BooleanField(max_length=10, default=False)

    def __str__(self):
        return self.type

class Author(models.Model):
    name = models.CharField(max_length=20)
    gender = models.BooleanField(max_length=10)
    birthday = models.DateField(max_length=20)
    age = models.IntegerField()
    img = models.CharField(max_length=50)
    introduction = models.CharField(max_length=200)
    is_delete = models.BooleanField(max_length=10, default=False)

    def __str__(self):
        return self.name

class Users(models.Model):
    name = models.CharField(max_length=20)
    pwd = models.CharField(max_length=20,default='123456')
    gender = models.BooleanField(max_length=10)
    birthday = models.DateField(max_length=20)
    age = models.IntegerField()
    img = models.CharField(max_length=50)
    introduction = models.CharField(max_length=200)
    is_delete = models.BooleanField(max_length=10, default=False)

    def __str__(self):
        return self.name

class Comment(models.Model):
    new = models.ForeignKey('News', on_delete=models.CASCADE)
    user = models.ForeignKey('Users', on_delete=models.CASCADE)
    content = models.CharField(max_length=300)
    time = models.DateField(max_length=20, default=datetime.datetime.now().strftime('%Y-%m-%d'))