import 'dart:async';
import 'dart:io';

import 'package:catalogo_widget_flutter/ui/core/ui/imagen_remota.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('exige descripción para una imagen informativa', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ImagenRemota(
          url: 'https://catalogo.test/imagen.jpg',
          descripcion: '   ',
        ),
      ),
    );

    expect(tester.takeException(), isA<AssertionError>());
  });

  testWidgets('mantiene el indicador mientras la respuesta está pendiente', (
    tester,
  ) async {
    final cuerpo = StreamController<List<int>>();
    final cliente = _ClienteFalso(
      _RespuestaFalsa(statusCode: HttpStatus.ok, cuerpo: cuerpo.stream),
    );

    final clienteAnterior = debugNetworkImageHttpClientProvider;
    debugNetworkImageHttpClientProvider = () => cliente;
    try {
      await tester.pumpWidget(
        const MaterialApp(
          home: ImagenRemota(
            url: 'https://catalogo.test/imagen.jpg',
            descripcion: 'Imagen de prueba',
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await cuerpo.close();
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('No se pudo cargar la imagen'), findsOneWidget);
    } finally {
      debugNetworkImageHttpClientProvider = clienteAnterior;
    }
  });

  testWidgets('muestra la alternativa cuando la respuesta HTTP falla', (
    tester,
  ) async {
    final cliente = _ClienteFalso(
      _RespuestaFalsa(
        statusCode: HttpStatus.notFound,
        cuerpo: const Stream<List<int>>.empty(),
      ),
    );

    final clienteAnterior = debugNetworkImageHttpClientProvider;
    debugNetworkImageHttpClientProvider = () => cliente;
    try {
      await tester.pumpWidget(
        const MaterialApp(
          home: ImagenRemota(
            url: 'https://catalogo.test/no-existe.jpg',
            descripcion: 'Imagen de prueba',
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('No se pudo cargar la imagen'), findsOneWidget);
    } finally {
      debugNetworkImageHttpClientProvider = clienteAnterior;
    }
  });
}

class _ClienteFalso implements HttpClient {
  _ClienteFalso(this.respuesta);

  final HttpClientResponse respuesta;

  @override
  Future<HttpClientRequest> getUrl(Uri url) async => _PeticionFalsa(respuesta);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _PeticionFalsa implements HttpClientRequest {
  _PeticionFalsa(this.respuesta);

  final HttpClientResponse respuesta;
  final HttpHeaders _headers = _CabecerasFalsas();

  @override
  HttpHeaders get headers => _headers;

  @override
  Future<HttpClientResponse> close() async => respuesta;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _RespuestaFalsa extends Stream<List<int>> implements HttpClientResponse {
  _RespuestaFalsa({required this.statusCode, required this._cuerpo});

  final Stream<List<int>> _cuerpo;

  @override
  final int statusCode;

  @override
  int get contentLength => -1;

  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int>)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) => _cuerpo.listen(
    onData,
    onError: onError,
    onDone: onDone,
    cancelOnError: cancelOnError,
  );

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _CabecerasFalsas implements HttpHeaders {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
