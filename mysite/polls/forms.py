# -*- coding: utf-8 -*-
from django import forms
from django.core.validators import validate_email

class ContactForm(forms.Form):
	error_css_class = 'error'
	required_css_class = 'required'
	contact_name = forms.CharField(label='Votre nom', max_length=100, required=True)
	contact_first_name = forms.CharField(label='Votre prénom', max_length=100, required=True)
	contact_mail = forms.EmailField(label='Votre email', max_length=254, required=True)
	contact_subject = forms.CharField(label='Sujet du message', max_length=100, required=True)
	contact_message = forms.CharField(label='Votre message', required=True, widget=forms.Textarea)
	cc_myself = forms.BooleanField(label='Me mettre en copie',required=False)

	def __init__(self, *args, **kwargs):
		super(ContactForm, self).__init__(*args, **kwargs)
		for field_name, field in self.fields.items():
			# print field
			# print field_name
			field.widget.attrs['class'] = 'form-control'