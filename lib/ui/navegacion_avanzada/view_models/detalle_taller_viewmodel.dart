import '../../../domain/models/taller.dart';
import '../../../domain/repositories/inscripciones_repository.dart';

class DetalleTallerViewModel {
  DetalleTallerViewModel(InscripcionesRepository repository, this.id) {
    for (final candidato in repository.obtenerTalleres()) {
      if (candidato.id == id) {
        taller = candidato;
        break;
      }
    }
  }
  final String id;
  Taller? taller;
}
