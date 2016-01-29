from django.conf.urls import url

from . import views

app_name='polls'
urlpatterns = [
    # ex: /polls/
    # url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^$', views.index, name='index'),
    # ex: /polls/5/
    url(r'^(?P<pk>[0-9]+)/$', views.DetailView.as_view(), name='detail'),
    # ex: /polls/5/results/
    url(r'^(?P<pk>[0-9]+)/results/$', views.ResultsView.as_view(), name='results'),
    # ex: /polls/5/vote/
    url(r'^(?P<question_id>[0-9]+)/vote/$', views.vote, name='vote'),
    
    # url(r'^contact/$', views.contact_form, name='contact'),
    # ex: /polls/content
    # url(r'^content/$', views.ContentView.as_view(), name='content'),
    # ex: /polls/content/1/ r'^(?P<question_id>[0-9]+)/vote/$
    url(r'^content/(?P<slug>[\w-]+)/$', views.PageContentView.as_view(), name='page-content'),
    # url(r'^(?P<pk>[0-9]+)/content/$', views.PageContentView.as_view(), name='page-content'),
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve'),
]