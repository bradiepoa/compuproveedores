# Generated by Django 4.0 on 2024-01-01 18:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0009_bitacora_contracto'),
    ]

    operations = [
        migrations.AddField(
            model_name='cliente',
            name='numero',
            field=models.CharField(default=1, max_length=255, verbose_name='numero'),
            preserve_default=False,
        ),
    ]
