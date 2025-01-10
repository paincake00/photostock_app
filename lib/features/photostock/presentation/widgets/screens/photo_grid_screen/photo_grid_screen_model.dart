import 'package:elementary/elementary.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';
import 'package:photostock_app/features/photostock/domain/usecases/get_photos.dart';

/// Photo grid screen model
class PhotoGridScreenModel extends ElementaryModel {
  final GetPhotosUseCase _getPhotosUseCase;

  PhotoGridScreenModel(
    this._getPhotosUseCase,
    ErrorHandler errorHandler,
  ) : super(errorHandler: errorHandler);

  /// Get photos
  Future<List<PhotoEntity>> getPhotos(int page) async {
    try {
      final data = await _getPhotosUseCase.call(
        params: page,
      );
      return data;
    } on Exception catch (e) {
      handleError(e);
      rethrow;
    }
  }
}
