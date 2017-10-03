from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.template import loader
from django.urls import reverse
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout as django_logout
from .models import *

# Create your views here.
@login_required
def logout(request):
    django_logout(request)
    return redirect('login')

@login_required
def index(request):
    if request.user.is_authenticated and request.user.groups.all().count() > 0:
        cities = City.objects.order_by('-name')
        industries = Industry.objects.order_by('-name')
        hotels = Hotel.objects.order_by('-name')
        libraries = Library.objects.order_by('-name')
        colleges = College.objects.order_by('-name')
        group = request.user.groups.all()
        context = {
            'group': group,
            'cities': cities,
            'industries': industries,
            'hotels': hotels,
            'colleges': colleges,
            'libraries': libraries,
        }
        return render(request, 'home/index.html', context)
    else:
        return redirect('login')

@login_required
def city(request, city_id):
    city = get_object_or_404(City, pk=city_id)
    context = {
        'city': city
    }
    return render(request, 'cities/city.html', context)

@login_required
def industry(request, industry_id):
    industry = get_object_or_404(Industry, pk=industry_id)
    context = {
        'industry': industry
    }
    return render(request, 'industries/industry.html', context)

@login_required
def hotel(request, hotel_id):
    hotel = get_object_or_404(Hotel, pk=hotel_id)
    context = {
        'hotel': hotel
    }
    return render(request, 'hotels/hotel.html', context)

@login_required
def college(request, college_id):
    college = get_object_or_404(College, pk=college_id)
    context = {
        'college': college
    }
    return render(request, 'colleges/college.html', context)

@login_required
def library(request, library_id):
    library = get_object_or_404(Library, pk=library_id)
    context = {
        'library': library
    }
    return render(request, 'libraries/library.html', context)
