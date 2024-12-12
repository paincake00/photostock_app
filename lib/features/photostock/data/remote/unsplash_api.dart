import 'dart:io';

import 'package:dio/dio.dart';
import 'package:photostock_app/core/constants/constants.dart';
import 'package:photostock_app/core/resources/data_state.dart';
import 'package:photostock_app/features/photostock/data/models/photos_model.dart';

class UnsplashApi {
  final Dio _dio;

  UnsplashApi({
    required Dio dio,
  }) : _dio = dio;

  Future<DataState<PhotosModel>> getPhotos() async {
    try {
      final response = await _dio.get(
        'photos/',
        queryParameters: {
          'client_id': apiKey,
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        return DataSuccess(PhotosModel.fromJson(data));
      }

      return DataError(
        DioException(
          error: response.statusMessage,
          response: response,
          type: DioExceptionType.unknown,
          requestOptions: response.requestOptions,
        ),
      );
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
