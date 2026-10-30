import 'package:flutter/material.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/icono_estado.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/icono_favorito.dart';

class IconEjemplosPantalla extends StatelessWidget {
  const IconEjemplosPantalla({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Ejemplos de Iconos')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('IconoEstado', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Representa el estado de una ruta con símbolo, color y etiqueta accesible. estado es obligatorio; tamano es opcional y vale 32. Selecciona EstadoRuta para cambiar el estado.'),
        const SelectableText("IconoEstado(estado: EstadoRuta.completada, tamano: 32)", style: TextStyle(fontFamily: 'monospace')),
        const Divider(),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(children: [IconoEstado(estado: EstadoRuta.pendiente), Text('Pendiente')]),
          Column(children: [IconoEstado(estado: EstadoRuta.completada), Text('Completada')]),
          Column(children: [IconoEstado(estado: EstadoRuta.error), Text('Error')]),
        ]),
      ]))),
      Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('IconoFavorito', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Muestra un corazón sin estado interno ni acción al pulsar. marcado es opcional y vale false; tamano es opcional y vale 32.'),
        const SelectableText('IconoFavorito(marcado: true, tamano: 32)', style: TextStyle(fontFamily: 'monospace')),
        const Divider(),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(children: [IconoFavorito(), Text('Sin marcar')]),
          Column(children: [IconoFavorito(marcado: true), Text('Marcado')]),
        ]),
      ]))),
    ]),
  );
}
