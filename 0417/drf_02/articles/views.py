from django.shortcuts import get_list_or_404, get_object_or_404
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Article, Comment
from .serializers import ArticleSerializer, ArticleDetailSerializer, CommentSerializer
from rest_framework import status

# Create your views here.
@api_view(["GET", "POST"])
def article_list(request):
  if request.method == "GET":
    article = get_list_or_404(Article)
    serializer = ArticleSerializer(article, many=True)
    return Response(serializer.data)

  elif request.method == "POST":
    serializer = ArticleSerializer(data=request.data)
    if serializer.is_valid(raise_exception=True):
      serializer.save()
      return Response(serializer.data, status=status.HTTP_201_CREATED)
    # raise_exception=True 로 대체
    # return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(["GET", "DELETE", "PUT"])
def article_detail(request, article_pk):
  article = get_object_or_404(Article, pk=article_pk)
  
  if request.method == "GET":
    serializer = ArticleDetailSerializer(article)
    return Response(serializer.data)
  
  elif request.method == "DELETE":
    article.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)
  
  elif request.method == "PUT":
    serializer = ArticleDetailSerializer(article, data=request.data)
    if serializer.is_valid(raise_exception=True):
      serializer.save()
      return Response(serializer.data, status=status.HTTP_200_OK)

@api_view(["GET"])
def comment_list(request):
  if request.method == "GET":
    comments = get_list_or_404(Comment)
    serializer = CommentSerializer(comments, many=True)
    return Response(serializer.data)

@api_view(["GET", "DELETE", "PUT"])
def comment_detail(request, comment_pk):
  comment = get_object_or_404(Comment, pk=comment_pk)
  
  if request.method == "GET":
    serializer = CommentSerializer(comment)
    return Response(serializer.data)
  
  elif request.method == "DELETE":
    comment.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)
  
  elif request.method == "PUT":
    serializer = CommentSerializer(comment, data=request.data)
    if serializer.is_valid(raise_exception=True):
      serializer.save()
      return Response(serializer.data)

@api_view(["GET", "POST"])
def article_comments(request, article_pk):
  article = get_object_or_404(Article, pk=article_pk)
  
  if request.method == "GET":
    comments = article.comment_set.all()
    serializer = CommentSerializer(comments, many=True)
    return Response(serializer.data)
  
  elif request.method == "POST":
    serializer = CommentSerializer(data=request.data)
    if serializer.is_valid(raise_exception=True):
      serializer.save(article=article)
      return Response(serializer.data, status=status.HTTP_201_CREATED)