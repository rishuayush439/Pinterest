// import '../../domain/entities/pin.dart';
// import '../../domain/repositories/home_repository.dart';
// import '../datasources/home_remote_datasource.dart';

// class HomeRepositoryImpl implements HomeRepository {
//   final HomeRemoteDataSource remoteDataSource;

//   HomeRepositoryImpl(this.remoteDataSource);

//   @override
//   Future<List<Pin>> getPins() async {
//     return await remoteDataSource.getPins();
//   }
// }



import '../../domain/entities/pin.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Pin>> getPins() async {
    return await remoteDataSource.getPins();
  }

  @override
  Future<List<Pin>> searchPins(String query) async {
    return await remoteDataSource.searchPins(query);
  }
}
