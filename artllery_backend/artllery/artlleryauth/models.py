from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.
class Profile(models.Model):
    user  = models.OneToOneField(User, on_delete=models.CASCADE)
    date_of_birth = models.DateTimeField(blank=True, null=True)
    address = models.TextField(blank=True, max_length=200, null=True)
    profile_picture = models.ImageField(blank=True, null=True)
    phone = models.CharField(max_length=15, blank=True, null=True)

    def __str__(self):
        return self.user

#this method to generate profile when user is created
@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

#this method to update profile when user is updated
@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()

