# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-09-15 20:55
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('post', '0004_post_slug'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='slug',
            field=models.SlugField(max_length=60, unique=True),
        ),
    ]
