# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2015-12-22 14:43
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0009_auto_20151222_1140'),
    ]

    operations = [
        migrations.AddField(
            model_name='video',
            name='resume',
            field=models.CharField(default='', max_length=300),
        ),
    ]
