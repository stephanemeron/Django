# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2015-12-21 10:07
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Content',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('resume', models.CharField(max_length=500)),
                ('text', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('upload', models.FileField(upload_to='images')),
            ],
        ),
        migrations.AddField(
            model_name='content',
            name='image',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='polls.Image'),
        ),
    ]
