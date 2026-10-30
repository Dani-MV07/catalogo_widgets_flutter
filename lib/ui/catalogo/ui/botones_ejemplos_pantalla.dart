import 'package:flutter/material.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/boton_accion.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/boton_con_icono.dart';

class BotonesEjemplosPantalla extends StatelessWidget {
  const BotonesEjemplosPantalla({super.key});

  Widget _seccion(String titulo, String descripcion, String codigo, List<Widget> ejemplos) =>
      Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(titulo, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8), Text(descripcion),
        SelectableText(codigo, style: const TextStyle(fontFamily: 'monospace')),
        const Divider(), ...ejemplos,
      ])));

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Ejemplos de Botones')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      _seccion('BotonAccion', 'Botón principal con estilo local. texto y onPressed son obligatorios (el callback puede ser null); destacado es opcional y false por defecto. Null desactiva el botón. El estilo no cambia la acción.',
        "BotonAccion(texto: 'Guardar', onPressed: () => debugPrint('Guardar'))",
        [
          BotonAccion(texto: 'Acción normal', onPressed: () => debugPrint('Acción normal')),
          const SizedBox(height: 8),
          BotonAccion(texto: 'Acción destacada', destacado: true, onPressed: () => debugPrint('Acción destacada')),
          const SizedBox(height: 8),
          const BotonAccion(texto: 'Desactivado', onPressed: null),
        ]),
      _seccion('BotonConIcono', 'Botón con icono y texto. texto, icono y onPressed son obligatorios; secundario es opcional y false por defecto. La acción principal usa FilledButton.icon y la secundaria OutlinedButton.icon.',
        "BotonConIcono(texto: 'Abrir', icono: Icons.open_in_new, onPressed: () {})",
        [
          BotonConIcono(texto: 'Acción principal', icono: Icons.directions, onPressed: () => debugPrint('Principal')),
          const SizedBox(height: 8),
          BotonConIcono(texto: 'Acción secundaria', icono: Icons.bookmark_border, secundario: true, onPressed: () => debugPrint('Secundaria')),
        ]),
    ]),
  );
}
