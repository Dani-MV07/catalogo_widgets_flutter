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

  Color getColorLetra() {
    Color colorLetra = switch (tipo) {
      TipoTexto.cuerpo => Colors.black,
      TipoTexto.subtitulo => Colors.blueGrey,
      TipoTexto.titulo => Colors.indigo,
    };
    return colorLetra;
  }

  FontWeight getAnchoLetra() {
    FontWeight anchoLetra = switch (tipo) {
      TipoTexto.cuerpo => FontWeight.normal,
      TipoTexto.subtitulo => FontWeight.normal,
      TipoTexto.titulo => FontWeight.bold,
    };
    return anchoLetra;
  }

  double getTamanyoTexto() {
    double tamanyoTexto = switch (tipo) {
      TipoTexto.cuerpo => 16,
      TipoTexto.subtitulo => 10,
      TipoTexto.titulo => 20,
    };
    return tamanyoTexto;
  }

  @override
  Widget build(BuildContext context) {
    double tamanyoTexto = getTamanyoTexto();
    FontWeight anchoLetra = getAnchoLetra();
    Color colorLetra = getColorLetra();

    final estilo = TextStyle(
      fontSize: tamanyoTexto,
      fontWeight: anchoLetra,
      color: colorLetra,
    );

    return Text(texto, style: estilo);
  }
}
