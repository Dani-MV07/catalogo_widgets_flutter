import 'package:flutter/material.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/pantalla_demostracion.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/boton_aviso.dart';

class ScaffoldEjemplosPantalla extends StatelessWidget {
  const ScaffoldEjemplosPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return PantallaDemostracion(
      titulo: 'Ejemplos de Scaffold y AppBar',
      contenido: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(child: Padding(padding: EdgeInsets.all(16), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('PantallaDemostracion', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Construye un Scaffold con AppBar y body. titulo y contenido son obligatorios; destacada y centrarTitulo son opcionales y false por defecto. destacada cambia los colores locales de la barra y centrarTitulo alinea el título. contenido se muestra sin modificar.'),
              SelectableText("PantallaDemostracion(titulo: 'Rutas', contenido: MiContenido(), destacada: true, centrarTitulo: true)", style: TextStyle(fontFamily: 'monospace')),
              SizedBox(height: 8),
              Text('La pantalla de esta sección usa la barra normal y el título alineado a la izquierda.'),
            ],
          ))),
          Card(child: Padding(padding: EdgeInsets.all(16), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('BotonAviso', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Muestra una SnackBar. etiqueta y mensaje son obligatorios; flotante es opcional y false por defecto; segundos es opcional y vale 3, debe ser positivo.'),
              SelectableText("BotonAviso(etiqueta: 'Mostrar', mensaje: 'Ruta guardada', flotante: true, segundos: 3)", style: TextStyle(fontFamily: 'monospace')),
            ],
          ))),
          SizedBox(height: 8),
          _Avisos(),
        ],
      ),
    );
  }
}

class _Avisos extends StatelessWidget {
  const _Avisos();

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      BotonAviso(etiqueta: 'Aviso fijo', mensaje: 'La ruta se ha guardado.', segundos: 3),
      SizedBox(height: 8),
      BotonAviso(etiqueta: 'Aviso flotante', mensaje: 'Aviso: revisa la ruta.', flotante: true, segundos: 5),
    ],
  );
}
