// import 'package:dio/dio.dart';
// import '../models/pin_model.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// abstract class HomeRemoteDataSource {
//   Future<List<PinModel>> getPins();
  
// }

// class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
//   final Dio dio;

//   HomeRemoteDataSourceImpl(this.dio);

//  @override
//   Future<List<PinModel>> getPins() async {
//     final response = await dio.get(
//       '/curated',
//       options: Options(
//         headers: {'Authorization': dotenv.env['PEXELS_API_KEY']},
//       ),
//     );

//     final List photos = response.data['photos'];
//     return photos.map((e) => PinModel.fromJson(e)).toList();
//   }
// }






// // import 'package:dio/dio.dart';
// // import 'package:flutter_dotenv/flutter_dotenv.dart';
// // import '../models/pin_model.dart';

// // class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
// //   final Dio dio;

// //   HomeRemoteDataSourceImpl(this.dio);

// //   @override
// //   Future<List<PinModel>> getPins() async {
// //     final response = await dio.get(
// //       '/curated',
// //       options: Options(
// //         headers: {'Authorization': dotenv.env['PEXELS_API_KEY']},
// //       ),
// //     );

// //     final List photos = response.data['photos'];
// //     return photos.map((e) => PinModel.fromJson(e)).toList();
// //   }
// // }

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/pin_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<PinModel>> getPins();
  Future<List<PinModel>> searchPins(String query); // 👈 added
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PinModel>> getPins() async {
    final response = await dio.get(
      '/curated',
      options: Options(
        headers: {'Authorization': dotenv.env['PEXELS_API_KEY']},
      ),
    );

    final List photos = response.data['photos'];
    return photos.map((e) => PinModel.fromJson(e)).toList();
  }

  @override
  Future<List<PinModel>> searchPins(String query) async {
    final response = await dio.get(
      '/search',
      queryParameters: {'query': query, 'per_page': 30},
      options: Options(
        headers: {'Authorization': dotenv.env['PEXELS_API_KEY']},
      ),
    );

    final List photos = response.data['photos'];
    return photos.map((e) => PinModel.fromJson(e)).toList();
  }
}
