# Generated by Django 4.0 on 2024-01-09 22:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
        ('core', '0016_alter_direccióndereporte_client'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='bitacora',
            name='Contrato',
        ),
        migrations.AddField(
            model_name='bitacora',
            name='contrato',
            field=models.CharField(default=1, max_length=255, verbose_name='contrato'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='accesorios',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='acciones_correctivas',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='clave',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='cliente',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='bitacoras', to='core.cliente'),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='descripcion',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='estado',
            field=models.IntegerField(blank=True, choices=[(0, 'Recibido'), (1, 'Proceso'), (2, 'Cerrada'), (3, 'Cancelado')]),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='falla',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='fecha',
            field=models.DateTimeField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='fecha_aviso',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='fecha_factura',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='fecha_recepcion',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='fecha_vencimiento',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='garantia_costo',
            field=models.BooleanField(blank=True, default=False, verbose_name='Garantía con costo'),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='guia',
            field=models.CharField(blank=True, max_length=10),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='lugar_servicio',
            field=models.IntegerField(blank=True, choices=[(1, 'Taller'), (2, 'Sitio')], null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='num_factura',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='observaciones',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='otros',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='poliza_original',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='renovaciones', to='core.bitacora'),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='refacciones',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='sucursal',
            field=models.IntegerField(blank=True, choices=[(1, 'TIJUANA'), (2, 'HERMOSILLO'), (3, 'CULIACAN'), (4, 'AGUASCALIENTES')], null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='tipo',
            field=models.IntegerField(blank=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='tipo_equipo',
            field=models.IntegerField(blank=True, choices=[(1, 'Portatil'), (2, 'Computadora'), (3, 'Impresora'), (4, 'Otros')], null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='tipo_servicio',
            field=models.IntegerField(blank=True, choices=[(1, 'Preventivo/Correctivo'), (2, 'Diagnóstico/Cotización'), (3, 'Instalación/Configuración')], null=True),
        ),
        migrations.AlterField(
            model_name='bitacora',
            name='usuario',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.PROTECT, related_name='bitacoras', to='auth.user'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='celular',
            field=models.CharField(blank=True, max_length=255, verbose_name='Celular'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='ciudad',
            field=models.CharField(blank=True, max_length=255, verbose_name='Ciudad'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='contacto',
            field=models.CharField(blank=True, max_length=255, verbose_name='Contacto'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='direccion',
            field=models.CharField(blank=True, max_length=255, verbose_name='Dirección'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='distribuidor',
            field=models.OneToOneField(blank=True, on_delete=django.db.models.deletion.PROTECT, to='core.distribuidor'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='email',
            field=models.EmailField(blank=True, max_length=255, verbose_name='Correo'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='estado',
            field=models.CharField(blank=True, max_length=255, verbose_name='Estado'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='nombre',
            field=models.CharField(blank=True, max_length=255, verbose_name='Nombre'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='numero',
            field=models.CharField(blank=True, max_length=255, verbose_name='numero'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='numero_de_cliente',
            field=models.CharField(blank=True, max_length=255, verbose_name='Número de Cliente'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='rfc',
            field=models.CharField(blank=True, max_length=255, verbose_name='RFC'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='sucursal',
            field=models.IntegerField(blank=True, choices=[('', '---------'), (1, 'TIJUANA'), (2, 'HERMOSILLO'), (3, 'CULIACAN'), (4, 'AGUASCALIENTES')]),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='telefono',
            field=models.CharField(blank=True, max_length=255, verbose_name='Teléfono'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='telefono_extra',
            field=models.CharField(blank=True, max_length=255, verbose_name='Teléfono Extra'),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='vender',
            field=models.CharField(blank=True, choices=[('vendor1', 'vendor1'), ('vendor2', 'vendor2')], max_length=200, verbose_name='Vendedor'),
        ),
        migrations.AlterField(
            model_name='direccióndereporte',
            name='address',
            field=models.TextField(blank=True, max_length=254),
        ),
    ]
