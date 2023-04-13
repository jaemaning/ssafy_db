from django.urls import path, include
from . import views

urlpatterns = [
  path("articles/", views.article_list),
  path("<int:article_pk>/", views.article_detail),
]
