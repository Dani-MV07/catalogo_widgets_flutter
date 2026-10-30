import 'package:flutter/material.dart';

class PlaceholderEjemplosPantalla extends StatelessWidget {
  const PlaceholderEjemplosPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplos de Placeholders')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Placeholder',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Widget temporal para reservar el espacio de una parte de la '
            'interfaz que todavía no está implementada. child permite mostrar '
            'contenido dentro del espacio.',
          ),
          const SelectableText(
            "Placeholder(child: Text('Aquí irá el mapa'))",
            style: TextStyle(fontFamily: 'monospace'),
          ),
          const Divider(),
          const SizedBox(
            height: 140,
            child: Placeholder(child: Center(child: Text('Aquí irá el mapa'))),
          ),
        ],
      ),
    );
  }
}
