# Generated by Django 5.1.6 on 2025-02-15 17:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0011_ticket_ticket_id_alter_ticket_price'),
    ]

    operations = [
        migrations.RenameField(
            model_name='event',
            old_name='price',
            new_name='price_regular',
        ),
        migrations.AddField(
            model_name='event',
            name='capacity',
            field=models.PositiveIntegerField(default=100),
        ),
        migrations.AddField(
            model_name='event',
            name='price_vip',
            field=models.DecimalField(decimal_places=2, default=0.0, max_digits=10),
        ),
    ]
