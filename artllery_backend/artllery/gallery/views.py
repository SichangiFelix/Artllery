from django.shortcuts import render
from rest_framework import generics, permissions
from .models import *
from .serializers import *


# Create your views here.
class ListCreateArt(generics.ListCreateAPIView):
    queryset = Art.objects.all()
    serializer_class = ArtSerializer
    authentication_classes = []
class RetrieveUpdateDestroyArt(generics.RetrieveUpdateDestroyAPIView):
    queryset = Art.objects.all()
    serializer_class = ArtSerializer
class ListCreateArtImage(generics.ListCreateAPIView):
    queryset = ArtImage.objects.all()
    serializer_class = ArtImageSerializer
class RetrieveUpdateDestroyArtImage(generics.RetrieveUpdateDestroyAPIView):
    queryset = ArtImage.objects.all()
    serializer_class = ArtImageSerializer
