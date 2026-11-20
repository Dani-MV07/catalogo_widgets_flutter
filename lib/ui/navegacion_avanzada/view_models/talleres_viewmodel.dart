import '../../../domain/models/taller.dart';
import '../../../domain/repositories/inscripciones_repository.dart';

class TalleresViewModel {
  TalleresViewModel(InscripcionesRepository repository, {String consulta = ''})
    : talleres = List.unmodifiable(
        repository.obtenerTalleres().where(
          (t) => t.titulo.toLowerCase().contains(consulta.trim().toLowerCase()),
        ),
      );
  final List<Taller> talleres;
}
