from __future__ import unicode_literals
import datetime
from django.db import models
from django.utils import timezone

class Question(models.Model):
	question_text = models.CharField(max_length=200)
	pub_date = models.DateTimeField('date published')
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)

	def __str__(self):
		return self.question_text.encode('utf8')

	def was_published_recently(self):
		return self.pub_date >= timezone.now() - datetime.timedelta(days=1)

class Choice(models.Model):
	question = models.ForeignKey(Question, on_delete=models.CASCADE)
	choice_text = models.CharField(max_length=200)
	votes = models.IntegerField(default=0)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)

	def __str__(self):
		return self.choice_text.encode('utf8')

class Image(models.Model):
	title = models.CharField(max_length=200)
	upload = models.ImageField(upload_to="images")
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)

	def slide_thumbnail(self):
		if self.upload:
			return '<img src="/static/media/%s"/>' % self.upload
		return '{img src="/static/media/images/icon-just-say-no.gif" alt="False"}'
	slide_thumbnail.allow_tags = True

	def __str__(self):
		return self.title

class Content(models.Model):
	title = models.CharField(max_length=200)
	resume = models.CharField(max_length = 500)
	text = models.TextField(blank=True)
	image = models.ForeignKey(Image, blank=True, null=True)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)
	slug = models.SlugField(unique=True)

	# @models.permalink
	# def get_absolute_url(self):
	# 	return 'polls:page-content', (self.slug,)

	def __str__(self):
		return self.title.encode('utf8')


class Video(models.Model):
	title = models.CharField(max_length=200)
	resume = models.CharField(max_length=300, default="")
	upload = models.FileField(upload_to="videos")
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)

	# def slide_thumbnail(self):
	# 	if self.upload:
	# 		return '<img src="/static/media/%s"/>' % self.upload
	# 	return '{img src="/static/media/images/icon-just-say-no.gif" alt="False"}'
	# slide_thumbnail.allow_tags = True

	def __str__(self):
		return self.title