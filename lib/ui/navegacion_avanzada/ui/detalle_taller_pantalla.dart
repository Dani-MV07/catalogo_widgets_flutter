import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../view_models/detalle_taller_viewmodel.dart';

class DetalleTallerPantalla extends StatelessWidget {
  const DetalleTallerPantalla({super.key, required this.viewModel});
  final DetalleTallerViewModel viewModel;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Detalle del taller')),
    body: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          viewModel.taller?.titulo ?? 'No existe el taller ${viewModel.id}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/talleres');
            }
          },
          child: const Text('Volver al listado'),
        ),
      ],
    ),
  );
}
