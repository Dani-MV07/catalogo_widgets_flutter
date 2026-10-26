import 'package:flutter/material.dart';

class IconEjemplosPantalla extends StatelessWidget {
  const IconEjemplosPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplos de Iconos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Icon(Icons.favorite),
          const Icon(Icons.terrain, size: 48, color: Colors.teal),
          const Icon(Icons.check_circle, semanticLabel: 'Ruta completada'),
          const Icon(
            Icons.arrow_back,
            textDirection: TextDirection.rtl,
            semanticLabel: 'Atrás',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  child: IconButton(
                    tooltip: 'Guardar ruta',
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {
                      debugPrint('Pulsación en guardar ruta');
                    },
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  child: IconButton(
                    tooltip: 'Guardar ruta',
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {
                      debugPrint('Pulsación en guardar ruta');
                    },
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  child: IconButton(
                    tooltip: 'Guardar ruta',
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {
                      debugPrint('Pulsación en guardar ruta');
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
