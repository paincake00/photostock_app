import 'package:dio/dio.dart';
import 'package:photostock_app/core/constants/constants.dart';
import 'package:photostock_app/core/resources/data_state.dart';
import 'package:photostock_app/features/photostock/data/remote/unsplash_api.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';
import 'package:photostock_app/features/photostock/domain/repository/photo_repository.dart';

/// Photo repository implementation
class PhotoRepositoryImpl implements PhotoRepository {
  /// Unsplash API
  final UnsplashApi _unsplashApi;

  PhotoRepositoryImpl({
    required UnsplashApi unsplashApi,
  }) : _unsplashApi = unsplashApi;

  /// Get photos
  @override
  Future<DataState<List<PhotoEntity>>> getPhotos({required int page}) async {
    try {
      final response = await _unsplashApi.getPhotos(
        clientId: UnsplashApiConstants.apiKey,
        perPage: UnsplashApiConstants.perPage,
        page: page,
      );
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
