from django.contrib import admin
from .models import Art, ArtImage, Artist

admin.site.register(Art)
admin.site.register(ArtImage)
admin.site.register(Artist)