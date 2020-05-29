from django.urls import path
from . import views


urlpatterns = [
    path('', views.index, name="index"),
    path('home', views.home, name="home"),
    path('single_post/<int:newid>', views.single_post, name="single_post"),
    path('categories/<str:newtype>/<int:page>', views.categories, name="categories"),
    path('search', views.search, name="search"),
    path('contact', views.contact, name="contact"),
    path('typography', views.typography, name="typography"),
    path('login', views.login, name="login"),
    path('register', views.register, name="register"),
    path('register_check', views.register_check, name="register_check"),
    path('login_check', views.login_check, name="login_check"),
    path('logout', views.logout, name="logout"),
    path('comment', views.comment, name="comment"),
]
