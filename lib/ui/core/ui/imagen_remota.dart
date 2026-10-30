import 'package:flutter/material.dart';

class ImagenRemota extends StatelessWidget {
  final String url;
  final BoxFit ajuste;
  final bool decorativa;
  final String? descripcion;

  const ImagenRemota({
    super.key,
    required this.url,
    this.ajuste = BoxFit.cover,
    this.decorativa = false,
    this.descripcion,
  }) : assert(
         decorativa || (descripcion != null && descripcion != ''),
         'Las imágenes no decorativas necesitan descripción',
       );

  @override
  Widget build(BuildContext context) {
    final imagen = SizedBox(
      height: 160,
      width: double.infinity,
      child: Image.network(
        url,
        fit: ajuste,
        semanticLabel: decorativa ? null : descripcion,
        loadingBuilder: (context, child, progreso) {
          if (progreso == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) =>
            const Center(child: Text('No se pudo cargar la imagen')),
      ),
    );
    return decorativa
        ? ExcludeSemantics(child: imagen)
        : Semantics(image: true, label: descripcion, child: imagen);
  }
}
