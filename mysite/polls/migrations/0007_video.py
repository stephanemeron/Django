# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2015-12-21 16:40
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0006_auto_20151221_1605'),
    ]

    operations = [
        migrations.CreateModel(
            name='Video',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('upload', models.ImageField(upload_to='videos')),
            ],
        ),
    ]