import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';

/// Photo repository
abstract class PhotoRepository {
  /// Get photos
  Future<List<PhotoEntity>> getPhotos({
    required int page,
  });
}
