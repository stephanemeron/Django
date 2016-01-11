from __future__ import unicode_literals
from django.contrib import admin

# Register your models here.
from .models import Question, Choice, Image, Content, Video

class SlideAdmin(admin.ModelAdmin):
	list_display = ('title', 'slide_thumbnail',)

class ChoiceInline(admin.TabularInline):
	model = Choice
	extra = 3

class QuestionAdmin(admin.ModelAdmin):
	fieldsets = [
		(None,{'fields': ['question_text']}),
		('Date information', {'fields': ['pub_date'], 'classes': ['collapse']})
	]
	inlines = [ChoiceInline]
	list_display = ('question_text', 'pub_date', 'was_published_recently')

class ContentAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("title",)}

admin.site.register(Question, QuestionAdmin)
# admin.site.register(Choice)
admin.site.register(Image, SlideAdmin)
admin.site.register(Content, ContentAdmin)
admin.site.register(Video)
	
