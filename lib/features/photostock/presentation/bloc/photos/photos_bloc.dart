import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photostock_app/core/resources/data_state.dart';
import 'package:photostock_app/features/photostock/domain/usecases/get_photos.dart';
import 'package:photostock_app/features/photostock/presentation/bloc/photos/photos_event.dart';
import 'package:photostock_app/features/photostock/presentation/bloc/photos/photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final GetPhotosUseCase _getPhotosUseCase;

  PhotosBloc({
    required GetPhotosUseCase getPhotosUseCase,
  })  : _getPhotosUseCase = getPhotosUseCase,
        super(const PhotosLoading()) {
    on<GetPhotosEvent>(_onGetPhotos);
  }

  void _onGetPhotos(
    GetPhotosEvent event,
    Emitter<PhotosState> emit,
  ) async {
    emit(const PhotosLoading());

    final dataState = await _getPhotosUseCase.call();

    if (dataState is DataSuccess && dataState.data != null) {
      emit(PhotosDone(data: dataState.data!));
    }

    if (dataState is DataError) {
      emit(PhotosError(error: dataState.error!));
    }
  }
}
