from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404
from django.template import loader

from .models import *

# Create your views here.

def index(request):
    cities = City.objects.order_by('-name')
    industries = Industry.objects.order_by('-name')
    hotels = Hotel.objects.order_by('-name')
    context = {
        'cities': cities,
        'industries': industries,
        'hotels': hotels,
    }
    return render(request, 'home/index.html', context)

def city(request, city_id):
    city = get_object_or_404(City, pk=city_id)
    context = {
        'city': city
    }
    return render(request, 'cities/city.html', context)

def industry(request, industry_id):
    industry = get_object_or_404(Industry, pk=industry_id)
    context = {
        'industry': industry
    }
    return render(request, 'industries/industry.html', context)

def hotel(request, hotel_id):
    hotel = get_object_or_404(Hotel, pk=hotel_id)
    context = {
        'hotel': hotel
    }
    return render(request, 'hotels/hotel.html', context)
