# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-09-15 20:38
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('post', '0002_post_abstract'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='abstract',
            field=models.TextField(),
        ),
    ]
