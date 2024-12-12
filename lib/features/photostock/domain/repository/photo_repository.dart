import 'package:photostock_app/core/resources/data_state.dart';
import 'package:photostock_app/features/photostock/domain/entities/elements_entity.dart';

abstract class PhotoRepository {
  Future<DataState<ElementsEntity>> getPhotos();
}
