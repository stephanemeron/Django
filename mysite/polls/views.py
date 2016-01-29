from django.http import HttpResponse, HttpResponseRedirect,Http404
# from django.template import RequestContext, loader
from django.shortcuts import get_object_or_404, render
from django.core.urlresolvers import reverse
from django.views import generic

from .models import Question, Choice, Content, Video
from .forms import ContactForm

def index(request):
	# latest_question_list = Question.objects.order_by('-pub_date')[:5]
	arrayReturn = {};
	"""Return the last five published questions."""
	# return Question.objects.order_by('-pub_date')[:5]
	arrayReturn['question'] = Question.objects.order_by('-pub_date')[:5]
	arrayReturn['content'] = content(request)
	arrayReturn['video'] = Video.objects.all()[:1]
	arrayReturn['contact_form'] = contact_form(request)
	# template = loader.get_template('polls/index.html')
	# context = RequestContext(request, {
	# 	'latest_question_list': latest_question_list,
	# })
	# return HttpResponse(template.render(context))
	context = {'latest_question_list': arrayReturn, 'error_message': "L'id n'existe pas, patttttttatte"}
	return render(request, 'polls/index.html', context)

# def detail(request, question_id):
# 	# Methode pour gerer le message erreur
# 	# try:
# 	# 	question = Question.objects.get(pk=question_id)
# 	# except Question.DoesNotExist:
# 	# 	raise Http404("Question does not exist")
# 	# Fin de la methode pour gerer le message erreur
# 	# Methode sans gerer le message d erreur, mais plus compacte
# 	question = get_object_or_404(Question,pk=question_id, )
# 	# Fin de la methode sans gerer le message d erreur, mais plus compacte
# 	return render(request, 'polls/detail.html', {'question': question})

# def results(request, question_id):
# 	question = get_object_or_404(Question, pk=question_id)
# 	# response = "You're looking at the results of question %s."
# 	return render(request, 'polls/results.html', {'question': question})

# class IndexView(generic.ListView):

# 	template_name = 'polls/index.html'
# 	context_object_name = 'latest_question_list'
# 	def get_queryset(self):
# 		arrayReturn = {};
# 		"""Return the last five published questions."""
# 		# return Question.objects.order_by('-pub_date')[:5]
# 		arrayReturn['question'] = Question.objects.order_by('-pub_date')[:5]
# 		arrayReturn['video'] = Video.objects.all()[:1]
# 		arrayReturn['contact_form'] = contact_form(self.request)
# 		return arrayReturn


class DetailView(generic.DetailView):
	model = Question
	template_name = 'polls/detail.html'


class ResultsView(generic.DetailView):
	model = Question
	template_name = 'polls/results.html'

def vote(request, question_id):
	question = get_object_or_404(Question, pk=question_id)
	try:
		selected_choice = question.choice_set.get(pk=request.POST['choice'])
	except (KeyError, Choice.DoesNotExist):
		# Redisplay the question voting form.
		context = {'question': question, 'error_message': "You didn't select a choice."}
		return render(request, 'polls/detail.html', context)
	else:
		selected_choice.votes += 1
		selected_choice.save()
		# Always return an HttpResponseRedirect after successfully dealing
		# with POST data. This prevents data from being posted twice if a
		# user hits the Back button.
		return HttpResponseRedirect(reverse('polls:results', args=(question.id,)))

# class ContentView(generic.ListView):
# 	template_name = 'polls/content.html'
# 	context_object_name = 'content_list'

# 	def get_queryset(self):
# 		"""Return the list of content."""
# 		return Content.objects.order_by('-created_at')

class PageContentView(generic.DetailView):
	model = Content
	template_name = 'polls/page-content.html'
	slug_field = 'slug'

# def contact_form(request):
# 		# if this is a POST request we need to process the form data
# 		if request.method == 'POST':
# 			# create a form instance and populate it with data from the request:
# 			form = ContactForm(request.POST)
# 			# check whether it's valid:
# 			if form.is_valid():
# 				contact = form.cleaned_data['contact_first_name']+' '+form.cleaned_data['contact_name']
# 				subject = form.cleaned_data['contact_subject']
# 				message = form.cleaned_data['contact_message']
# 				sender = form.cleaned_data['contact_mail']
# 				cc_myself = form.cleaned_data['cc_myself']

# 				recipients = ['stephane.meron@gmail.com']
# 				if cc_myself:
# 					recipients.append(sender)

# 				send_mail(subject, message, sender, recipients)
# 				# redirect to a new URL:
# 				return HttpResponseRedirect('/thanks/')

# 		# if a GET (or any other method) we'll create a blank form
# 		else:
# 			form = ContactForm()

# 		return render(request, 'polls/contact.html', {'form': form})
def contact_form(request):
	# if this is a POST request we need to process the form data
	if request.method == 'POST':
		# create a form instance and populate it with data from the request:
		form = ContactForm(request.POST)
		# check whether it's valid:
		if form.is_valid():
			contact = form.cleaned_data['contact_first_name']+' '+form.cleaned_data['contact_name']
			subject = form.cleaned_data['contact_subject']
			message = form.cleaned_data['contact_message']
			sender = form.cleaned_data['contact_mail']
			cc_myself = form.cleaned_data['cc_myself']

			recipients = ['stephane.meron@gmail.com']
			if cc_myself:
				recipients.append(sender)

			send_mail(subject, message, sender, recipients)
			# redirect to a new URL:
			return HttpResponseRedirect('/thanks/')

	# if a GET (or any other method) we'll create a blank form
	else:
		form = ContactForm()
	return render(request, 'polls/contact.html', {'form': form})

def content(request):
	content = Content.objects.order_by('-updated_at')[:5]
# 	# Fin de la methode sans gerer le message d erreur, mais plus compacte
# 	return render(request, 'polls/detail.html', {'question': question})
	return render(request, 'polls/content.html', {'content_list': content})