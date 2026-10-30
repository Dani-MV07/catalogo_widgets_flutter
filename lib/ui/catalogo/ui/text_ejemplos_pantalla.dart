import 'package:catalogo_widget_flutter/ui/core/ui/etiqueta_catalogo.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/texto_jerarquico.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/texto_resumen.dart';
import 'package:flutter/material.dart';

class TextEjemplosPantalla extends StatelessWidget {
  const TextEjemplosPantalla({super.key});

  Widget _codigo(String codigo) => SizedBox(
    width: double.infinity,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromARGB(255, 3, 245, 172),
          width: 3,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16),
        child: SelectableText(
          codigo,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 14,
            height: 1.5,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    const textoJerarquico = 'Ruta del río';
    const textoLargo =
        'La ruta sigue el río entre árboles y montañas hasta llegar al pueblo.';

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
                children: [
                  const Text(
                    'EtiquetaCatalogo',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Muestra un texto normal, destacado o de aviso. texto es '
                    'obligatorio y variante es opcional; por defecto es '
                    'VarianteEtiqueta.normal. En la primera versión, '
                    'destacada ? estiloDestacado : estiloNormal seleccionaba '
                    'uno de dos estilos. El enum permite añadir el aviso sin '
                    'crear otra clase.',
                  ),
                  const SizedBox(height: 8),
                  _codigo(
                    "EtiquetaCatalogo(texto: 'Ruta del río')\n"
                    "EtiquetaCatalogo(texto: 'Ruta del río', "
                    "variante: VarianteEtiqueta.destacada)\n"
                    "EtiquetaCatalogo(texto: 'Aviso: revisa la ruta', "
                    "variante: VarianteEtiqueta.aviso)",
                  ),
                  const Divider(),
                  const EtiquetaCatalogo(texto: textoJerarquico),
                  const EtiquetaCatalogo(
                    texto: textoJerarquico,
                    variante: VarianteEtiqueta.destacada,
                  ),
                  const EtiquetaCatalogo(
                    texto: 'Aviso: revisa la ruta',
                    variante: VarianteEtiqueta.aviso,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'TextoJerarquico',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Recibe texto obligatorio y un tipo opcional, por defecto '
                    'TipoTexto.cuerpo. titulo, subtitulo y cuerpo cambian '
                    'tamaño y peso, pero conservan el contenido.',
                  ),
                  _codigo(
                    "TextoJerarquico(texto: 'Ruta del río', "
                    'tipo: TipoTexto.titulo)',
                  ),
                  const Divider(),
                  const TextoJerarquico(
                    texto: textoJerarquico,
                    tipo: TipoTexto.titulo,
                  ),
                  const TextoJerarquico(
                    texto: textoJerarquico,
                    tipo: TipoTexto.subtitulo,
                  ),
                  const TextoJerarquico(
                    texto: textoJerarquico,
                    tipo: TipoTexto.cuerpo,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'TextoResumen',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Recibe texto obligatorio, lineas opcional (por defecto 2 '
                    'y siempre positivo) y centrado opcional (por defecto '
                    'false). Si no cabe, muestra puntos suspensivos.',
                  ),
                  _codigo(
                    "TextoResumen(texto: 'Ruta corta', lineas: 1)\n"
                    "TextoResumen(texto: textoLargo, lineas: 2, centrado: true)",
                  ),
                  const Divider(),
                  const Text('Texto corto, una línea:'),
                  const SizedBox(
                    width: 220,
                    child: TextoResumen(texto: 'Ruta corta', lineas: 1),
                  ),
                  const Text('Texto largo, dos líneas y centrado:'),
                  const SizedBox(
                    width: 220,
                    child: TextoResumen(
                      texto: textoLargo,
                      lineas: 2,
                      centrado: true,
                    ),
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
