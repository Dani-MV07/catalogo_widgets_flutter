import 'package:go_router/go_router.dart';

import '../../domain/repositories/inscripciones_repository.dart';
import '../../ui/navegacion_avanzada/ui/talleres_pantalla.dart';
import '../../ui/navegacion_avanzada/ui/detalle_taller_pantalla.dart';
import '../../ui/navegacion_avanzada/view_models/talleres_viewmodel.dart';
import '../../ui/navegacion_avanzada/view_models/detalle_taller_viewmodel.dart';

GoRoute rutaTalleres(InscripcionesRepository repository) => GoRoute(
  path: '/talleres',
  name: 'talleres',
  builder: (context, state) => TalleresPantalla(
    viewModel: TalleresViewModel(
      repository,
      consulta: state.uri.queryParameters['q'] ?? '',
    ),
  ),
  routes: [
    GoRoute(
      path: ':id',
      name: 'taller',
      builder: (context, state) => DetalleTallerPantalla(
        viewModel: DetalleTallerViewModel(
          repository,
          state.pathParameters['id']!,
        ),
      ),
    ),
  ],
);
