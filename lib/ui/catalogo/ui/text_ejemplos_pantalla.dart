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
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'TextoJerarquico',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Muestra texto con tres niveles de jerarquía.'),
                  SizedBox(height: 20),
                  Text(
                    'Propiedades',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'texto',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'monospace',
                          ),
                        ),
                        TextSpan(text: ': obligatorio. Texto que se muestra.'),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'tipo',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'monospace',
                          ),
                        ),
                        TextSpan(
                          text: ': opcional. Por defecto, TipoTexto.cuerpo.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Ejemplo de uso',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: Color.fromARGB(255, 3, 245, 172),
                            width: 3,
                          ),
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(16),
                        child: SelectableText(
                          "TextoJerarquico(\n"
                          "  texto: 'Ruta del río',\n"
                          "  tipo: TipoTexto.titulo,\n"
                          "),\n"
                          "TextoJerarquico(\n"
                          "  texto: 'Valencia, Beniganim',\n"
                          "  tipo: TipoTexto.subtitulo,\n"
                          "),\n"
                          "TextoJerarquico(\n"
                          "  texto: 'Lugar donde pasan la mayoria de rios de España',\n"
                          "  tipo: TipoTexto.cuerpo,\n"
                          "),",
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 14,
                            height: 1.5,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Resultado',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
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
