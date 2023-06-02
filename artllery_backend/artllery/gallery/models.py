from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Art(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(max_length=500)
    dimensions = models.CharField(max_length=20)
    price = models.FloatField
    datePosted = models.DateTimeField(auto_now_add=True)
    materials = models.CharField(max_length=200)
    status = models.CharField(max_length=20)
    artist = models.ForeignKey(User,on_delete=models.CASCADE) #add User model referenced

class ArtImage(models.Model):
    image = models.ImageField(upload_to="images/")
    art = models.ForeignKey(Art, on_delete=models.CASCADE)

# class Artist(models.Model):
#     first_name = models.CharField(max_length=30)
#     second_name = models.CharField(max_length=30)
#     username = models.CharField(max_length=30)
#     email = models.CharField(max_length=20)
#     phone = models.CharField(max_length=20)
#Use this custom Artist model to add extra user details

#Research on how to rep cart
