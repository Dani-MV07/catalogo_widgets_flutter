import 'package:catalogo_widget_flutter/ui/core/ui/boton_aviso.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/pantalla_demostracion.dart';
import 'package:flutter/material.dart';

class ScaffoldEjemplosPantalla extends StatefulWidget {
  const ScaffoldEjemplosPantalla({super.key});

  @override
  State<ScaffoldEjemplosPantalla> createState() =>
      _ScaffoldEjemplosPantallaState();
}

class _ScaffoldEjemplosPantallaState extends State<ScaffoldEjemplosPantalla> {
  bool _destacada = false;
  bool _centrarTitulo = false;

  @override
  Widget build(BuildContext context) {
    return PantallaDemostracion(
      titulo: 'Ejemplos de Scaffold y AppBar',
      destacada: _destacada,
      centrarTitulo: _centrarTitulo,
      contenido: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PantallaDemostracion',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Construye un Scaffold con AppBar. titulo y contenido son '
                    'obligatorios; destacada y centrarTitulo son opcionales '
                    'y false por defecto. El contenido se muestra sin '
                    'modificar. Activa las opciones para comparar la barra.',
                  ),
                  const SelectableText(
                    "PantallaDemostracion(titulo: 'Rutas', "
                    'contenido: MiContenido(), destacada: true, '
                    'centrarTitulo: true)',
                    style: TextStyle(fontFamily: 'monospace'),
                  ),
                  const SizedBox(height: 8),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Barra destacada'),
                    value: _destacada,
                    onChanged: (value) {
                      setState(() => _destacada = value ?? false);
                    },
                  ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Centrar título'),
                    value: _centrarTitulo,
                    onChanged: (value) {
                      setState(() => _centrarTitulo = value ?? false);
                    },
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'BotonAviso',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Muestra un SnackBar. etiqueta y mensaje son '
                    'obligatorios; flotante es opcional y false por defecto; '
                    'segundos es opcional, vale 3 y debe ser positivo.',
                  ),
                  const SelectableText(
                    "BotonAviso(etiqueta: 'Mostrar', "
                    "mensaje: 'Ruta guardada', flotante: true, segundos: 3)",
                    style: TextStyle(fontFamily: 'monospace'),
                  ),
                  const Divider(),
                  const BotonAviso(
                    etiqueta: 'Aviso fijo',
                    mensaje: 'La ruta se ha guardado.',
                    segundos: 3,
                  ),
                  const SizedBox(height: 8),
                  const BotonAviso(
                    etiqueta: 'Aviso flotante',
                    mensaje: 'Aviso: revisa la ruta.',
                    flotante: true,
                    segundos: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
