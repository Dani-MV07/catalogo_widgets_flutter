import 'package:catalogo_widget_flutter/ui/catalogo/ui/scaffold_ejemplos_pantalla.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/boton_accion.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/boton_aviso.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/boton_con_icono.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/icono_estado.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/icono_favorito.dart';
import 'package:catalogo_widget_flutter/ui/core/ui/texto_resumen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TextoResumen limita líneas y permite centrar', (tester) async {
    const texto =
        'Una ruta larga atraviesa el bosque, sigue el río y llega al pueblo.';
    await tester.pumpWidget(
      const MaterialApp(
        home: SizedBox(
          width: 120,
          child: TextoResumen(texto: texto, lineas: 1, centrado: true),
        ),
      ),
    );

    final widget = tester.widget<Text>(find.text(texto));
    expect(widget.maxLines, 1);
    expect(widget.overflow, TextOverflow.ellipsis);
    expect(widget.textAlign, TextAlign.center);
  });

  test('TextoResumen rechaza un número de líneas no positivo', () {
    expect(
      () => TextoResumen(texto: 'Texto', lineas: 0),
      throwsA(isA<AssertionError>()),
    );
  });

  testWidgets('los iconos mantienen símbolo y etiqueta según su estado', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Column(
          children: [
            IconoEstado(estado: EstadoRuta.pendiente),
            IconoEstado(estado: EstadoRuta.completada),
            IconoEstado(estado: EstadoRuta.error),
            IconoFavorito(),
            IconoFavorito(marcado: true),
          ],
        ),
      ),
    );

    final iconos = tester.widgetList<Icon>(find.byType(Icon)).toList();
    expect(iconos.map((icono) => icono.semanticLabel), [
      'Ruta pendiente',
      'Ruta completada',
      'Error en la ruta',
      'Favorito sin marcar',
      'Favorito marcado',
    ]);
    expect(iconos[0].icon, isNot(iconos[1].icon));
    expect(iconos[1].icon, isNot(iconos[2].icon));
    expect(iconos[3].icon, isNot(iconos[4].icon));
  });

  testWidgets('los botones ejecutan su callback una vez y el nulo no actúa', (
    tester,
  ) async {
    var acciones = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              BotonAccion(texto: 'Normal', onPressed: () => acciones++),
              BotonAccion(
                texto: 'Destacado',
                destacado: true,
                onPressed: () => acciones++,
              ),
              BotonAccion(texto: 'Desactivado', onPressed: null),
              BotonConIcono(
                texto: 'Principal',
                icono: Icons.directions,
                onPressed: () => acciones++,
              ),
              BotonConIcono(
                texto: 'Secundario',
                icono: Icons.bookmark,
                secundario: true,
                onPressed: () => acciones++,
              ),
            ],
          ),
        ),
      ),
    );

    await tester.tap(find.text('Normal'));
    await tester.pump();
    expect(acciones, 1);

    await tester.tap(find.text('Destacado'));
    await tester.pump();
    expect(acciones, 2);

    await tester.tap(find.text('Desactivado'));
    await tester.pump();
    expect(acciones, 2);

    await tester.tap(find.text('Principal'));
    await tester.pump();
    await tester.tap(find.text('Secundario'));
    await tester.pump();
    expect(acciones, 4);
  });

  testWidgets('BotonAviso muestra el mensaje y la duración configurada', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BotonAviso(
            etiqueta: 'Avisar',
            mensaje: 'Ruta guardada',
            flotante: true,
            segundos: 3,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Avisar'));
    await tester.pump();
    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
    expect(snackBar.behavior, SnackBarBehavior.floating);
    expect(snackBar.duration, const Duration(seconds: 3));
    expect(find.text('Ruta guardada'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(find.byType(SnackBar), findsNothing);
  });

  testWidgets('BotonAviso también muestra el aviso fijo con el tiempo pedido', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BotonAviso(
            etiqueta: 'Avisar',
            mensaje: 'La ruta se ha guardado.',
            segundos: 2,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Avisar'));
    await tester.pump(const Duration(milliseconds: 300));
    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
    expect(snackBar.behavior, SnackBarBehavior.fixed);
    expect(snackBar.duration, const Duration(seconds: 2));
    expect(find.text('La ruta se ha guardado.'), findsOneWidget);
  });

  testWidgets('la pantalla permite comprobar las dos opciones del AppBar', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: ScaffoldEjemplosPantalla()),
    );

    var appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.centerTitle, false);
    expect(appBar.backgroundColor, isNull);
    expect(find.text('PantallaDemostracion'), findsOneWidget);

    await tester.tap(find.text('Barra destacada'));
    await tester.pump();
    appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.backgroundColor, Colors.indigo);

    await tester.tap(find.text('Centrar título'));
    await tester.pump();
    appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.centerTitle, true);
  });
}
