import 'package:catalogo_widget_flutter/data/repositories/articulos_repository.dart';
import 'package:catalogo_widget_flutter/data/services/articulos_local_service.dart';
import 'package:catalogo_widget_flutter/ui/catalogo/ui/contenedores_1_ejemplos_pantalla.dart';
import 'package:catalogo_widget_flutter/ui/prestamos/ui/ejemplo_datos_pantalla.dart';
import 'package:catalogo_widget_flutter/ui/inscripcion/ui/inscripcion_ejemplo_pantalla.dart';
import 'package:flutter/material.dart';

import 'text_ejemplos_pantalla.dart';
import 'image_ejemplos_pantalla.dart';
import 'icon_ejemplos_pantalla.dart';
import 'botones_ejemplos_pantalla.dart';
import 'placeholder_ejemplos_pantalla.dart';
import 'scaffold_ejemplos_pantalla.dart';

class CatalogoPantalla extends StatelessWidget {
  const CatalogoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de widgets')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.text_fields),
            title: const Text('Text'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const TextEjemplosPantalla(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.image_outlined),
            title: const Text('Image'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const ImageEjemplosPantalla(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.star_outline),
            title: const Text('Icon'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const IconEjemplosPantalla(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.smart_button_outlined),
            title: const Text('Botones'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const BotonesEjemplosPantalla(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.crop_square),
            title: const Text('Placeholder'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const PlaceholderEjemplosPantalla(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.web_asset),
            title: const Text('Scaffold y AppBar'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const ScaffoldEjemplosPantalla(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.text_fields),
            title: const Text('Contenedor'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const contenedores1(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory_2_outlined),
            title: const Text('Ejemplo con datos'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => EjemploDatosPantalla(
                    repository: ArticulosRepository(
                      service: const ArticulosLocalService(),
                    ),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.how_to_reg_outlined),
            title: const Text('Inscripción a talleres'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const InscripcionEjemploPantalla(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login de demostración'),
            onTap: () => Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder: (_) => const InscripcionEjemploPantalla(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
