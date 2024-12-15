import 'package:dio/dio.dart';
import 'package:photostock_app/core/constants/constants.dart';
import 'package:photostock_app/features/photostock/data/models/photo_model.dart';
import 'package:retrofit/retrofit.dart';

part 'unsplash_api.g.dart';

/// API Unsplash
@RestApi(baseUrl: apiUrl)
abstract class UnsplashApi {
  factory UnsplashApi(Dio dio, {String? baseUrl}) = _UnsplashApi;

  /// Get photos
  @GET('/photos')
  Future<List<PhotoModel>> getPhotos({
    @Query('client_id') required String clientId,
    @Query('per_page') required int perPage,
    @Query('page') required int page,
  });
}
