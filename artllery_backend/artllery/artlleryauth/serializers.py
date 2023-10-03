from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Profile

class UserCreateSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True, required=True)
    class Meta:
        model = User
        fields = [
            'username',
            'email',
            'password',

        ]
        extra_kwargs = {"password": {"write_only": True}}

    def create(self, validated_data):
        username = validated_data["username"]
        email = validated_data["email"]
        password = validated_data["password"]

        if (email and User.objects.filter(email=email).exclude(username=username).exists()):
            raise serializers.ValidationError(
                {"email": "Email addresses must be unique."})
        
        user = User(username = username, email = email)
        user.set_password(password)
        user.save()
        return user
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = (
            'username',
            'first_name',
            'last_name',
            'email',
            'address',
            'profile_picture',
            'phone'
        )