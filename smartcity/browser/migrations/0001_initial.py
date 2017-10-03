# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-10-03 11:52
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('map', models.ImageField(blank=True, null=True, upload_to='')),
            ],
        ),
        migrations.CreateModel(
            name='College',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('departments', models.CharField(max_length=200)),
                ('email', models.EmailField(max_length=70)),
            ],
        ),
        migrations.CreateModel(
            name='Hotel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('phone', models.CharField(max_length=12)),
                ('email', models.EmailField(max_length=70)),
            ],
        ),
        migrations.CreateModel(
            name='Industry',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('industry_type', models.CharField(choices=[['MED', 'Medical'], ['TECH', 'Technology'], ['BUILD', 'Building and Construction']], default='Technology', max_length=50)),
                ('email', models.EmailField(max_length=70)),
            ],
        ),
        migrations.CreateModel(
            name='Library',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('phone', models.CharField(max_length=12)),
                ('email', models.EmailField(max_length=70)),
            ],
        ),
        migrations.CreateModel(
            name='Mall',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('phone', models.CharField(max_length=12)),
                ('email', models.EmailField(max_length=70)),
                ('city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='browser.City')),
            ],
        ),
        migrations.CreateModel(
            name='Museum',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('phone', models.CharField(max_length=12)),
                ('email', models.EmailField(max_length=70)),
                ('city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='browser.City')),
            ],
        ),
        migrations.CreateModel(
            name='Park',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('phone', models.CharField(max_length=12)),
                ('email', models.EmailField(max_length=70)),
                ('city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='browser.City')),
            ],
        ),
        migrations.CreateModel(
            name='Restaurant',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('phone', models.CharField(max_length=12)),
                ('email', models.EmailField(max_length=70)),
                ('city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='browser.City')),
            ],
        ),
        migrations.CreateModel(
            name='Zoo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('phone', models.CharField(max_length=12)),
                ('email', models.EmailField(max_length=70)),
                ('city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='browser.City')),
            ],
        ),
    ]
