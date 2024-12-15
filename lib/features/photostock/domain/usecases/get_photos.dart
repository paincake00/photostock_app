import 'package:photostock_app/core/resources/data_state.dart';
import 'package:photostock_app/core/usecase/usecase.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';
import 'package:photostock_app/features/photostock/domain/repository/photo_repository.dart';

/// Get photos use case
class GetPhotosUseCase implements UseCase<DataState<List<PhotoEntity>>, int> {
  /// Photo repository
  final PhotoRepository _photoRepository;

  GetPhotosUseCase({
    required PhotoRepository photoRepository,
  }) : _photoRepository = photoRepository;

  /// Call method
  @override
  Future<DataState<List<PhotoEntity>>> call({required int params}) {
    return _photoRepository.getPhotos(
      page: params,
    );
  }
}
