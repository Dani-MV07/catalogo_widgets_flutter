import 'package:flutter/material.dart';

class TextoResumen extends StatelessWidget {
  final String texto;
  final int lineas;
  final bool centrado;

  const TextoResumen({
    super.key,
    required this.texto,
    this.lineas = 2,
    this.centrado = false,
  }) : assert(lineas > 0, 'lineas debe ser positivo');

  @override
  Widget build(BuildContext context) {
    final centro = centrado ? TextAlign.center : TextAlign.left;
    return Text(
      texto,
      maxLines: lineas,
      textAlign: centro,
      overflow: TextOverflow.ellipsis,
    );
  }
}
