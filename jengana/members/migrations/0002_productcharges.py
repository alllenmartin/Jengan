# Generated by Django 5.0.3 on 2024-04-01 09:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('members', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ProductCharges',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('charge_code', models.CharField(max_length=250, unique=True)),
                ('charge_description', models.CharField(max_length=250)),
                ('charge_amont', models.DecimalField(decimal_places=2, max_digits=10000)),
                ('use_percentage', models.BooleanField()),
                ('percentage', models.DecimalField(decimal_places=2, max_digits=10000)),
                ('charge_option', models.CharField(choices=[('On Approved Amount', 'On Approved Amount'), ('On Net Amount', 'On Net Amount')], default='On Approved Amount', max_length=250)),
                ('product_code', models.CharField(max_length=250)),
                ('minimum', models.DecimalField(decimal_places=2, max_digits=10000)),
                ('maximum', models.DecimalField(decimal_places=2, max_digits=10000)),
                ('additional_charges', models.DecimalField(decimal_places=2, max_digits=10000)),
                ('excise_duty', models.DecimalField(decimal_places=2, max_digits=10000)),
            ],
        ),
    ]