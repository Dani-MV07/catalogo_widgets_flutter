import 'package:flutter/material.dart';

class BotonAviso extends StatelessWidget {
  final String etiqueta;
  final String mensaje;
  final bool flotante;
  final int segundos;

  const BotonAviso({super.key, required this.etiqueta, required this.mensaje, this.flotante = false, this.segundos = 3})
      : assert(segundos > 0, 'segundos debe ser positivo');

  @override
  Widget build(BuildContext context) => FilledButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(mensaje),
              behavior: flotante ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
              duration: Duration(seconds: segundos),
            ));
        },
        child: Text(etiqueta),
      );
}
