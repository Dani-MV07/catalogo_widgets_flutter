import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AyudaPantalla extends StatefulWidget {
  const AyudaPantalla({super.key});
  @override
  State<AyudaPantalla> createState() => _AyudaPantallaState();
}

class _AyudaPantallaState extends State<AyudaPantalla> {
  bool _mostrar = false;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Ayuda')),
    body: ListView(
      children: [
        SwitchListTile(
          title: const Text('Mostrar consejos'),
          value: _mostrar,
          onChanged: (valor) => setState(() => _mostrar = valor),
        ),
        if (_mostrar)
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Elige un taller para consultar su detalle.'),
          ),
        FilledButton(
          onPressed: () => context.go('/'),
          child: const Text('Volver al catálogo'),
        ),
        FilledButton(
          onPressed: context.canPop()
              ? () => context.pop('Consejo leído')
              : null,
          child: const Text('He leído el consejo'),
        ),
      ],
    ),
  );
}
