from django.db import models

# Create your models here.
class City(models.Model):
    name = models.CharField(max_length=200)
    map = models.ImageField()

    def __str__(self):
        return self.name

    def has_parks(self):
        return self.park_set.count() > 0
    def has_zoos(self):
        return self.zoo_set.count() > 0
    def has_museums(self):
        return self.museum_set.count() > 0
    def has_malls(self):
        return self.mall_set.count() > 0
    def has_restaurants(self):
        return self.restaurant_set.count() > 0
    def has_map(self):
        return self.map != ''


class Park(models.Model):
    city = models.ForeignKey(City)
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    phone = models.CharField(max_length=12)
    email = models.EmailField(max_length=70)

    def __str__(self):
        return self.name

class Zoo(models.Model):
    city = models.ForeignKey(City)
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    phone = models.CharField(max_length=12)
    email = models.EmailField(max_length=70)

    def __str__(self):
        return self.name

class Museum(models.Model):
    city = models.ForeignKey(City)
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    phone = models.CharField(max_length=12)
    email = models.EmailField(max_length=70)

    def __str__(self):
        return self.name

class Mall(models.Model):
    city = models.ForeignKey(City)
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    phone = models.CharField(max_length=12)
    email = models.EmailField(max_length=70)

    def __str__(self):
        return self.name

class Restaurant(models.Model):
    city = models.ForeignKey(City)
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    phone = models.CharField(max_length=12)
    email = models.EmailField(max_length=70)

    def __str__(self):
        return self.name

class Industry(models.Model):
    TYPE_CHOICES = [
        ['MED', 'Medical'],
        ['TECH', 'Technology'],
        ['BUILD', 'Building and Construction']
    ]
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    industry_type = models.CharField(max_length=50, choices = TYPE_CHOICES, default='Technology')
    email = models.EmailField(max_length=70)

    def __str__(self):
        return self.name

class Hotel(models.Model):
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    phone = models.CharField(max_length=12)
    email = models.EmailField(max_length=70)

    def __str__(self):
        return self.name
