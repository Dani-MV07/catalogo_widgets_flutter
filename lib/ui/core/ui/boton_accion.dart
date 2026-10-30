import 'package:flutter/material.dart';

class BotonAccion extends StatelessWidget {
  final String texto;
  final VoidCallback? onPressed;
  final bool destacado;

  const BotonAccion({super.key, required this.texto, required this.onPressed, this.destacado = false});

  @override
  Widget build(BuildContext context) => FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: destacado ? Colors.deepPurple : null,
          foregroundColor: destacado ? Colors.white : null,
          padding: EdgeInsets.symmetric(horizontal: destacado ? 28 : 16, vertical: destacado ? 18 : 12),
        ),
        child: Text(texto),
      );
}
