from django.test import TestCase
from .models import *
from django.urls import reverse
# Create your tests here.

class CityModelTests(TestCase):
    def test_city_has_foreign_model_methods(self):
        test_city = City(name='test city')
        test_city.save()
        test_park = Park(city = test_city, name='test park', address='123 address', phone = '12345', email='email')
        test_park.save()
        self.assertIs(test_city.has_parks(), True)

class CityIndexViewTests(TestCase):
    def test_city_doesnt_display_if_unavailable(self):
        response = self.client.get(reverse('browser:index'))
        self.assertContains(response, "No cities are available")
        self.assertQuerysetEqual(response.context['cities'], [])

    def test_city_displays_if_available(self):
        test_city = City(name='test city')
        test_city.save()
        response = self.client.get(reverse('browser:index'))
        self.assertContains(response, "test city")
        self.assertQuerysetEqual(response.context['cities'], ['<City: test city>'])
