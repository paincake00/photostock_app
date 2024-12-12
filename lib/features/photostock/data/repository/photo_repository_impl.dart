import 'package:photostock_app/core/resources/data_state.dart';
import 'package:photostock_app/features/photostock/data/remote/unsplash_api.dart';
import 'package:photostock_app/features/photostock/domain/entities/elements_entity.dart';
import 'package:photostock_app/features/photostock/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final UnsplashApi _unsplashApi;

  PhotoRepositoryImpl({
    required UnsplashApi unsplashApi,
  }) : _unsplashApi = unsplashApi;

  @override
  Future<DataState<ElementsEntity>> getPhotos() async {
    return _unsplashApi.getPhotos();
  }
}
