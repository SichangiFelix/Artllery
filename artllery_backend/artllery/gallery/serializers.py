from rest_framework import serializers
from .models import Art, ArtImage

class ArtSerializer(serializers.ModelSerializer):
    class Meta:
        model = Art
        fields = ['id', 'name', 'description', 'dimensions', 'price', 'datePosted', 'materials', 'status', 'artist']

class ArtImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ArtImage
        fields = ['id', 'image', 'art']