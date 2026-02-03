import '../entities/pin.dart';

abstract class HomeRepository {
  Future<List<Pin>> getPins();
}
