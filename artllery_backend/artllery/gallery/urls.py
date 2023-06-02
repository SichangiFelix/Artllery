from django.urls import path
from .views import *

urlpatterns = [
    path('art/', ListCreateArt.as_view()),
    path('art/<int:pk>', RetrieveUpdateDestroyArt.as_view()),
    path('artImages/', ListCreateArtImage.as_view()),
    path('artImage/<int:pk>', RetrieveUpdateDestroyArtImage.as_view()),
]
