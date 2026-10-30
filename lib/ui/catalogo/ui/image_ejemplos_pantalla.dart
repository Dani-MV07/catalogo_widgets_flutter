import 'package:flutter/material.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/imagen_ruta.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/imagen_remota.dart';

class ImageEjemplosPantalla extends StatelessWidget {
  const ImageEjemplosPantalla({super.key});

  Widget _seccion(String titulo, String descripcion, String codigo, List<Widget> ejemplos) =>
      Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(titulo, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8), Text(descripcion), const SizedBox(height: 8),
          const Text('Ejemplo de uso', style: TextStyle(fontWeight: FontWeight.bold)),
          SelectableText(codigo, style: const TextStyle(fontFamily: 'monospace')),
          const Divider(), ...ejemplos,
        ],
      )));

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Ejemplos de Imagenes')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      _seccion('ImagenRuta', 'Carga una imagen local declarada en pubspec.yaml. rutaAsset y descripcion son obligatorios; panoramica es opcional y por defecto false. Usa cover y proporciones 240×180 o 300×120.',
        "ImagenRuta(rutaAsset: 'assets/images/Kappa_1800x1200.jpg', descripcion: 'Paisaje de ruta')",
        const [
          ImagenRuta(rutaAsset: 'assets/images/Kappa_1800x1200.jpg', descripcion: 'Paisaje en proporción normal'),
          SizedBox(height: 8),
          ImagenRuta(rutaAsset: 'assets/images/Kappa_1800x1200.jpg', panoramica: true, descripcion: 'Paisaje panorámico'),
        ]),
      _seccion('ImagenRemota', 'Carga una imagen por URL. url es obligatorio; ajuste por defecto BoxFit.cover, decorativa por defecto false y descripcion opcional solo si decorativa es true. Las imágenes informativas requieren una descripción no vacía. La altura reservada es 160 px.',
        "ImagenRemota(url: url, ajuste: BoxFit.contain, descripcion: 'Paisaje')",
        const [
          ImagenRemota(url: 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=600', ajuste: BoxFit.cover, descripcion: 'Paisaje recortado con cover'),
          SizedBox(height: 8),
          ImagenRemota(url: 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=600', ajuste: BoxFit.contain, descripcion: 'Paisaje completo con contain'),
          SizedBox(height: 8),
          ImagenRemota(url: 'https://example.invalid/imagen-no-existe.jpg', decorativa: true),
        ]),
    ]),
  );
}
