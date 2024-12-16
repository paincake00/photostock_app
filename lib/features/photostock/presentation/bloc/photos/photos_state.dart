import 'package:dio/dio.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';

/// Photos state
abstract class PhotosState {
  /// Photos data
  final List<PhotoEntity>? data;

  /// Photos error
  final DioException? error;

  const PhotosState({
    this.data,
    this.error,
  });
}

/// Photos loading
class PhotosLoading extends PhotosState {
  const PhotosLoading();
}

/// Photos done
class PhotosDone extends PhotosState {
  const PhotosDone({
    required List<PhotoEntity> data,
  }) : super(data: data);
}

/// Photos error
class PhotosError extends PhotosState {
  const PhotosError({
    required DioException error,
  }) : super(error: error);
}
