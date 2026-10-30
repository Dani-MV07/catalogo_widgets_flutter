import 'package:flutter/material.dart';

enum EstadoRuta { pendiente, completada, error }

class IconoEstado extends StatelessWidget {
  final EstadoRuta estado;
  final double tamano;

  const IconoEstado({super.key, required this.estado, this.tamano = 32});

  @override
  Widget build(BuildContext context) {
    final (icono, color, etiqueta) = switch (estado) {
      EstadoRuta.pendiente => (Icons.schedule, Colors.orange, 'Ruta pendiente'),
      EstadoRuta.completada => (Icons.check_circle, Colors.green, 'Ruta completada'),
      EstadoRuta.error => (Icons.error, Colors.red, 'Error en la ruta'),
    };
    return Icon(icono, size: tamano, color: color, semanticLabel: etiqueta);
  }
}
