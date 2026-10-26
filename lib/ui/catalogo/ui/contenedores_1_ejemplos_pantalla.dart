import 'package:flutter/material.dart';

class contenedores1 extends StatelessWidget {
  const contenedores1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplos de Contenedores')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            child: const Text('Próxima salida'),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              border: Border.all(color: Colors.amber.shade800, width: 2),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
