import 'package:photostock_app/core/resources/data_state.dart';
import 'package:photostock_app/core/usecase/usecase.dart';
import 'package:photostock_app/features/photostock/domain/entities/elements_entity.dart';
import 'package:photostock_app/features/photostock/domain/repository/photo_repository.dart';

class GetPhotosUseCase implements UseCase<DataState<ElementsEntity>, void> {
  final PhotoRepository _photoRepository;

  GetPhotosUseCase({
    required PhotoRepository photoRepository,
  }) : _photoRepository = photoRepository;

  @override
  Future<DataState<ElementsEntity>> call({void params}) {
    return _photoRepository.getPhotos();
  }
}
