# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-09-15 20:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('post', '0003_auto_20160915_1638'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='slug',
            field=models.SlugField(blank=True, max_length=60, null=True),
        ),
    ]
