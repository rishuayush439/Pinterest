import '../entities/pin.dart';
import '../repositories/home_repository.dart';

class GetPinsUseCase {
  final HomeRepository repository;

  GetPinsUseCase(this.repository);

  Future<List<Pin>> call() {
    return repository.getPins();
  }
}
