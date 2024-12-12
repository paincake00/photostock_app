import 'package:dio/dio.dart';
import 'package:photostock_app/features/photostock/domain/entities/elements_entity.dart';

abstract class PhotosState {
  final ElementsEntity? data;
  final DioException? error;

  const PhotosState({
    this.data,
    this.error,
  });
}

class PhotosLoading extends PhotosState {
  const PhotosLoading();
}

class PhotosDone extends PhotosState {
  const PhotosDone({
    required ElementsEntity data,
  }) : super(data: data);
}

class PhotosError extends PhotosState {
  const PhotosError({
    required DioException error,
  }) : super(error: error);
}
