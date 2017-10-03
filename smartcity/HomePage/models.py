from django.db import models
from django.core.validators import RegexValidator

# the following lines added:
import datetime
from django.utils import timezone

class Entity(models.Model):
   entity_name = models.CharField(max_length=200)
   modify_date = models.DateTimeField('date modified')

   def __str__(self):
       return self.entity_name

   def was_published_recently(self):
       now = timezone.now()
       return now - datetime.timedelta(days=1) <= self.modify_date <= now

   was_published_recently.admin_order_field = 'modify_date'
   was_published_recently.boolean = True
   was_published_recently.short_description = 'Modified recently?'


class Element(models.Model):
   entity = models.ForeignKey(Entity, on_delete=models.CASCADE)
   element_name = models.CharField(max_length=200)
   element_address = models.CharField(max_length=200)
   phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message = ("Must have format: '+999999999'. 15 digits allowed. + is optional"))
   element_phone =models.CharField(validators=[phone_regex], max_length=15, blank=True)
   element_email = models.EmailField(max_length=200)
   element_department = models.CharField(max_length=200,blank=True)
   element_industry_type = models.CharField(max_length=200,blank=True)
   rating = models.IntegerField(default=0)

   def __str__(self):
       return self.element_name