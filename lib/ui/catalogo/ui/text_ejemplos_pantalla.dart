import 'package:catalogo_widget_flutter/ui/core/ui/texto_jerarquico.dart';
import 'package:flutter/material.dart';

class TextEjemplosPantalla extends StatelessWidget {
  const TextEjemplosPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplos de Text')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextoJerarquico(texto: "cuerpo", tipo: TipoTexto.cuerpo),
          TextoJerarquico(texto: "subtitulo", tipo: TipoTexto.subtitulo),
          TextoJerarquico(texto: "titulo", tipo: TipoTexto.titulo),
        ],
      ),
    );
  }
}
