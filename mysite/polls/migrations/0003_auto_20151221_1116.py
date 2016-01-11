# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2015-12-21 11:16
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0002_auto_20151221_1007'),
    ]

    operations = [
        migrations.AddField(
            model_name='content',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, default=datetime.datetime(2015, 12, 21, 11, 15, 54, 169334, tzinfo=utc)),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='content',
            name='updated_at',
            field=models.DateTimeField(auto_now=True, default=datetime.datetime(2015, 12, 21, 11, 16, 3, 225407, tzinfo=utc)),
            preserve_default=False,
        ),
    ]
