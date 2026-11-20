import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../view_models/talleres_viewmodel.dart';

class TalleresPantalla extends StatelessWidget {
  const TalleresPantalla({super.key, required this.viewModel});
  final TalleresViewModel viewModel;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Talleres'),
      actions: [
        IconButton(
          tooltip: 'Catálogo',
          icon: const Icon(Icons.home_outlined),
          onPressed: () => context.go('/'),
        ),
      ],
    ),
    body: viewModel.talleres.isEmpty
        ? const Center(child: Text('No hay talleres para esta búsqueda'))
        : ListView.builder(
            itemCount: viewModel.talleres.length,
            itemBuilder: (context, index) {
              final taller = viewModel.talleres[index];
              return ListTile(
                title: Text(taller.titulo),
                subtitle: Text('Identificador: ${taller.id}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.goNamed(
                  'taller',
                  pathParameters: {'id': taller.id},
                ),
              );
            },
          ),
  );
}
