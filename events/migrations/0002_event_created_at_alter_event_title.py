# Generated by Django 5.1.6 on 2025-02-13 15:05

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, default=datetime.datetime(2024, 2, 13, 5, 30)),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='event',
            name='title',
            field=models.CharField(max_length=255),
        ),
    ]
