from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from .models import *
import math,random, os
from PIL import Image
# Create your views here.

def index(request):
    return HttpResponse('Hello world,this is my first django protect！')

def home(request):
    new_types = New_types.objects.filter(is_delete=False)
    home_news = News.objects.filter(is_delete=False).order_by('-read_num')
    hot_new1s = home_news[0:2]
    hot_new2s = home_news[2:4]
    big_news = home_news[4]
    hot_new3s = home_news[5:11]
    side_news = list()
    for i in range(8):
        side_news.append(home_news[random.randrange(len(home_news))])
    authors = Author.objects.all()
    username = request.session.get('username', None)
    return render(request, 'news/index.html',{'home':locals()})

def single_post(request, newid):
    home_news = News.objects.filter(is_delete=False).order_by('-read_num')
    new_types = New_types.objects.all().filter(is_delete=False)
    new = News.objects.filter(pk = newid).first()
    side_news = list()
    for i in range(8):
        side_news.append(home_news[random.randrange(len(home_news))])
    authors = Author.objects.all()
    username = request.session.get('username', None)
    comments = Comment.objects.filter(new=newid)
    return render(request, 'news/single_post.html',{'home':locals()})

def categories(request, newtype, page):
    home_news = News.objects.filter(is_delete=False).order_by('-read_num')
    hot_new1s = home_news[0:2]
    hot_new2s = home_news[2:4]
    new_types = New_types.objects.all().filter(is_delete=False)
    news = News.objects.filter(new_type__type__contains=newtype)
    page_num = math.ceil(len(news)/5)
    news = news[(page - 1) * 5 : (page-1)*5 + 5]
    page_num_list = [x for x in range(1,page_num+1) ]
    side_news = list()
    for i in range(8):
        side_news.append(home_news[random.randrange(len(home_news))])
    authors = Author.objects.all()
    username = request.session.get('username', None)
    return render(request, 'news/categories.html',{'home':locals()})

def search(request):
    home_news = News.objects.filter(is_delete=False).order_by('-read_num')
    hot_new1s = home_news[0:2]
    hot_new2s = home_news[2:4]
    new_types = New_types.objects.all().filter(is_delete=False)
    newtype = request.POST.get('search')
    news = News.objects.filter(name__contains=newtype)
    side_news = list()
    for i in range(8):
        side_news.append(home_news[random.randrange(len(home_news))])
    authors = Author.objects.all()
    username = request.session.get('username', None)
    return render(request, 'news/categories.html',{'home':locals()})

def contact(request):
    new_types = New_types.objects.all().filter(is_delete=False)
    return render(request, 'news/contact.html',{'home':locals()})

def typography(request):
    new_types = New_types.objects.all().filter(is_delete=False)
    return render(request, 'news/typography.html',{'home':locals()})

def login(request):
    if request.method == 'POST':
        request.session['username'] = request.POST['user_name']
        return redirect('home')
    else:
        return render(request, 'news/login.html')

def register(request):
    if request.method == 'POST':
        user = Users()
        user.name = request.POST['user_name']
        user.pwd = request.POST['user_password']
        user.age = request.POST['user_age']
        gender = request.POST['user_gender']
        if gender == '男':
            user.gender = True
        else:
            user.gender = False
        user.birthday = request.POST['user_birthday']
        user.introduction = request.POST['user_introduction']
        fimg = request.FILES['user_img']
        user.img = 'img/' + user.name + str(datetime.datetime.now().strftime('%Y%m%d')) + str(fimg.name)
        img = 'static/news/' + user.img
        Image.open(fimg).save(img)
        user.save()
        request.session['username'] = user.name
        return redirect('home')
    else:
        return render(request, 'news/register.html')

def register_check(request):
    name = request.POST.get('name')
    user = Users.objects.filter(name = name).exists()
    if user:
        check = 'no'
    else:
        check = 'yes'

    return JsonResponse({'check' : check})

def login_check(request):
    name = request.POST['name']
    pwd = request.POST['pwd']
    user = Users.objects.filter(name = name).first()
    if user:
        if pwd == user.pwd:
            check = 'yes'
        else:
            check = 'no2'
    else:
        check = 'no1'
    return JsonResponse({'check':check})

def logout(request):
    request.session.clear()
    return redirect('home')

def comment(request):
    username = request.session.get('username', None)
    if username == None:
        check = 'no'
    else:
        check = 'yes'
        newid = request.POST['new']
        content = request.POST['comment']
        user = Users.objects.filter(name = username ).first()
        new = News.objects.filter(pk = newid).first()
        comment = Comment()
        comment.new = new
        comment.user = user
        comment.content = content
        comment.save()
    return JsonResponse({'check':check})