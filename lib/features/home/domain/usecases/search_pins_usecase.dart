import '../entities/pin.dart';
import '../repositories/home_repository.dart';

class SearchPinsUseCase {
  final HomeRepository repository;

  SearchPinsUseCase(this.repository);

  Future<List<Pin>> call(String query) {
    return repository.searchPins(query);
  }
}
