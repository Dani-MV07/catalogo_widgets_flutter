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
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxqVCW7dbWX6wnKTpE2glyYIhHxp5Q6dqC1BC83dRPyQ&s=10',
            width: 480,
            height: 320,
            errorBuilder: (context, error, stackTrace) => SizedBox(
              height: 320,
              child: Center(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA4WOP08R6VOGp3WDYxVQEpLmf_QrvDgJBbTqoAgUq3Q&s=10',
                  height: 320,
                ),
              ),
            ),
            loadingBuilder: (context, child, progreso) {
              if (progreso == null) return child;
              return const SizedBox(
                height: 160,
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
          Image.asset('assets/images/Kappa_1800x1200.jpg'),
        ],
      ),
    );
  }
}
