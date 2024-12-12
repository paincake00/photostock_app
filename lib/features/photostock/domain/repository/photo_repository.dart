import 'package:photostock_app/core/resources/data_state.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';

/// Photo repository
abstract class PhotoRepository {
  /// Get photos
  Future<DataState<List<PhotoEntity>>> getPhotos();
}
