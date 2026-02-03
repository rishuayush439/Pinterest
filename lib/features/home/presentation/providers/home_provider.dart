import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasources/home_remote_datasource.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/usecases/get_pins_usecase.dart';
import '../../domain/entities/pin.dart';

final dioProvider = Provider<Dio>((ref) {
  return DioClient.createDio();
});

final homeProvider = FutureProvider<List<Pin>>((ref) async {
  final dio = ref.read(dioProvider);
  final dataSource = HomeRemoteDataSourceImpl(dio);
  final repository = HomeRepositoryImpl(dataSource);
  final useCase = GetPinsUseCase(repository);

  return useCase();
});
