import 'package:flutter/material.dart';

class ImageEjemplosPantalla extends StatelessWidget {
  const ImageEjemplosPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplos de Imagenes')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            width: 240,
            height: 160,
          ),
        ],
      ),
    );
  }
}
