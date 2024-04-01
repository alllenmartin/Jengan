from django.contrib import admin

from .models import CustomUser,ProductCharges,Loans

admin.site.register(CustomUser)
admin.site.register(ProductCharges)
admin.site.register(Loans)
