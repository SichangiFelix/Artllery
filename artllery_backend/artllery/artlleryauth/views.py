from .serializers import UserSerializer
from django.contrib.auth.models import User
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.decorators import api_view, permission_classes
from django.views.decorators.csrf import csrf_exempt
import jwt
from rest_framework import status
from rest_framework.response import Response
from django.conf import settings


# Create your views here.
class UserViewSet(viewsets.ModelViewSet):

    permission_classes = (IsAuthenticated,)
    serializer_class = UserSerializer
    queryset = User.objects.all()

@api_view(['POST'])
@csrf_exempt
@permission_classes((AllowAny,))
def register(request):
    # Extract the user credentials from the request
    first_name = request.data.get('first_name')
    username = request.data.get('username')
    email = request.data.get('email')
    password = request.data.get('password')
    
    # Create a new user with the provided credentials
    user = User.objects.create_user(username=username, email=email, password=password, first_name = first_name)
    
    # Generate a JWT token for the new user
    payload = {'user_id': user.id}
    jwt_token = jwt.encode(payload, settings.SECRET_KEY, algorithm='HS256')
    
    # Return the JWT token in the response
    return Response({'token': jwt_token}, status=status.HTTP_200_OK)