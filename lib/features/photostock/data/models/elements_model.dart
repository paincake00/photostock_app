import 'package:photostock_app/features/photostock/data/models/element_model.dart';
import 'package:photostock_app/features/photostock/domain/entities/elements_entity.dart';

class ElementsModel extends ElementsEntity {
  ElementsModel({super.data});

  factory ElementsModel.fromJson(List<Map<String, dynamic>> json) {
    return ElementsModel(
      data: (json as List<dynamic>)
          .map((el) => ElementModel.fromJson(el as Map<String, dynamic>))
          .toList(),
    );
  }
}
