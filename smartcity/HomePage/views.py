from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from .models import Entity, Element


class IndexView(generic.ListView):
    template_name = 'HomePage/index.html'
    context_object_name = 'latest_entity_list'

    def get_queryset(self):
        """Return the last five published questions."""
        return Entity.objects.order_by('-pub_date')[:5]


class DetailView(generic.DetailView):
    model = Entity
    template_name = 'HomePage/detail.html'


class ResultsView(generic.DetailView):
    model = Entity
    template_name = 'HomePage/results.html'

def rating(request, entity_id):
    entity = get_object_or_404(Entity, pk=entity_id)
    try:
        selected_choice = entity.element_set.get(pk=request.POST['element'])
    except (KeyError, Element.DoesNotExist):
        # Redisplay the question voting form.
        return render(request, 'HomePage/detail.html', {
            'entity': entity,
            'error_message': "You didn't select a element.",
        })
    else:
        return HttpResponseRedirect(reverse('polls:results', args=(entity.id,)))
