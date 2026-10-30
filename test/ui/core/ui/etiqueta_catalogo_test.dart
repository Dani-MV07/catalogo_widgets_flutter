import 'package:catalogo_widget_flutter/ui/core/ui/etiqueta_catalogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('muestra el texto y aplica el estilo de cada variante', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Column(
          children: [
            EtiquetaCatalogo(texto: 'Mismo texto'),
            EtiquetaCatalogo(
              texto: 'Mismo texto',
              variante: VarianteEtiqueta.destacada,
            ),
            EtiquetaCatalogo(
              texto: 'Aviso: revisa la ruta',
              variante: VarianteEtiqueta.aviso,
            ),
          ],
        ),
      ),
    );

    final textos = tester.widgetList<Text>(find.byType(Text)).toList();
    expect(textos.map((widget) => widget.data), [
      'Mismo texto',
      'Mismo texto',
      'Aviso: revisa la ruta',
    ]);
    expect(textos[0].style?.fontSize, 16);
    expect(textos[1].style?.fontSize, 24);
    expect(textos[1].style?.fontWeight, FontWeight.bold);
    expect(textos[2].style?.fontWeight, FontWeight.bold);
  });
}
