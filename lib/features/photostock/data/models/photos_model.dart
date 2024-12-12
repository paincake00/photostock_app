import 'package:photostock_app/features/photostock/data/models/photo_model.dart';
import 'package:photostock_app/features/photostock/domain/entities/photos_entity.dart';

class PhotosModel extends PhotosEntity {
  PhotosModel({super.data});

  factory PhotosModel.fromJson(List<Map<String, dynamic>> json) {
    return PhotosModel(
      data: (json as List<dynamic>)
          .map((el) => ElementModel.fromJson(el as Map<String, dynamic>))
          .toList(),
    );
  }
}
