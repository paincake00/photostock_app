import 'package:photostock_app/core/resources/data_state.dart';
import 'package:photostock_app/features/photostock/domain/entities/photos_entity.dart';

abstract class PhotoRepository {
  Future<DataState<PhotosEntity>> getPhotos();
}
