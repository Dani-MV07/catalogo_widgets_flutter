import 'package:flutter/material.dart';

enum TipoTexto { titulo, subtitulo, cuerpo }

class TextoJerarquico extends StatelessWidget {
  final String texto;
  final TipoTexto tipo;

  const TextoJerarquico({
    super.key,
    required this.texto,
    this.tipo = TipoTexto.cuerpo,
  });

  @override
  Widget build(BuildContext context) {
    final estilo = switch (tipo) {
      TipoTexto.titulo => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
      ),
      TipoTexto.subtitulo => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.blueGrey,
      ),
      TipoTexto.cuerpo => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    };

    return Text(texto, style: estilo);
  }
}
