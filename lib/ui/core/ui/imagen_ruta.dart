import 'package:flutter/material.dart';

class ImagenRuta extends StatelessWidget {
  final String rutaAsset;
  final bool panoramica;
  final String descripcion;

  const ImagenRuta({
    super.key,
    required this.rutaAsset,
    this.panoramica = false,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    final anchoMaximo = panoramica ? 300.0 : 240.0;
    final proporcion = panoramica ? 2.5 : 4 / 3;

    return Semantics(
      image: true,
      label: descripcion,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: anchoMaximo),
        child: AspectRatio(
          aspectRatio: proporcion,
          child: Image.asset(
            rutaAsset,
            fit: BoxFit.cover,
            excludeFromSemantics: true,
            errorBuilder: (context, error, stackTrace) =>
                const Center(child: Text('No se pudo cargar la imagen')),
          ),
        ),
      ),
    );
  }
}
