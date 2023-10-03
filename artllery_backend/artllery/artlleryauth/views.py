from .serializers import UserSerializer
from django.contrib.auth import get_user_model
from rest_framework import viewsets
from rest_framework import decorators, permissions, response, status
from django.views.decorators.csrf import csrf_exempt
import jwt
from rest_framework_simplejwt.tokens import RefreshToken
from django.conf import settings
from .serializers import UserCreateSerializer


User = get_user_model()

@decorators.api_view(["POST"])
@decorators.permission_classes([permissions.AllowAny])

def registration(request):
    serializer = UserCreateSerializer(data=request.data)
    if not serializer.is_valid():
        return response.Response(serializer.errors, status.HTTP_400_BAD_REQUEST)
    user = serializer.save()
    refresh = RefreshToken.for_user(user)
    res = {
        "refresh": str(refresh),
        "access": str(refresh.access_token),
    }
    return response.Response(res, status.HTTP_201_CREATED)