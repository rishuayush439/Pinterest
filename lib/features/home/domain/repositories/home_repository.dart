import '../entities/pin.dart';

abstract class HomeRepository {
  Future<List<Pin>> getPins();
   Future<List<Pin>> searchPins(String query);
}
