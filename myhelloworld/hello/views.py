from django.http import HttpResponse


def index(request):
    return HttpResponse("Hello World! IFB299 Group 98!.")