import 'package:catalogo_widget_flutter/ui/core/ui/texto_jerarquico.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/texto_resumen.dart';
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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(width: 300, height: 5),
                  TextoJerarquico(
                    texto: 'Ruta del río',
                    tipo: TipoTexto.titulo,
                  ),
                  TextoJerarquico(
                    texto: "Valencia, Beniganim",
                    tipo: TipoTexto.subtitulo,
                  ),
                  TextoJerarquico(
                    texto: "Lugar donde pasan la mayoria de rios de España",
                    tipo: TipoTexto.cuerpo,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
