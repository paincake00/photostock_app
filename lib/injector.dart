import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:photostock_app/core/constants/constants.dart';
import 'package:photostock_app/features/photostock/data/remote/unsplash_api.dart';
import 'package:photostock_app/features/photostock/data/repository/photo_repository_impl.dart';
import 'package:photostock_app/features/photostock/domain/repository/photo_repository.dart';
import 'package:photostock_app/features/photostock/domain/usecases/get_photos.dart';
import 'package:photostock_app/features/photostock/presentation/bloc/photos/photos_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // API
  sl.registerSingleton<UnsplashApi>(
    UnsplashApi(
      dio: Dio(
        BaseOptions(
          baseUrl: apiUrl,
        ),
      ),
    ),
  );

  // Repository
  sl.registerSingleton<PhotoRepository>(
    PhotoRepositoryImpl(
      unsplashApi: sl(),
    ),
  );

  // UseCase
  sl.registerSingleton<GetPhotosUseCase>(
    GetPhotosUseCase(
      photoRepository: sl(),
    ),
  );

  // Bloc
  sl.registerFactory<PhotosBloc>(
    () => PhotosBloc(
      getPhotosUseCase: sl(),
    ),
  );
}
