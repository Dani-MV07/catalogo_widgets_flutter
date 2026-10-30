// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:catalogo_widget_flutter/main.dart';

void main() {
  testWidgets('abre la pantalla de ejemplos de Text desde el catálogo', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Catálogo de widgets'), findsOneWidget);
    await tester.tap(find.text('Text'));
    await tester.pumpAndSettle();

    expect(find.text('Ejemplos de Text'), findsOneWidget);
    expect(find.text('EtiquetaCatalogo'), findsOneWidget);
  });
}
