import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:photostock_app/features/photostock/data/remote/unsplash_api.dart';
import 'package:photostock_app/features/photostock/data/repository/photo_repository_impl.dart';
import 'package:photostock_app/features/photostock/domain/repository/photo_repository.dart';
import 'package:photostock_app/features/photostock/domain/usecases/get_photos.dart';
import 'package:photostock_app/features/photostock/presentation/bloc/photos/photos_bloc.dart';

/// Service locator
final serviceLocator = GetIt.instance;

/// Initialize dependencies
Future<void> initDependencies() async {
  // API
  serviceLocator.registerSingleton<UnsplashApi>(
    UnsplashApi(
      Dio(
        BaseOptions(
          contentType: 'application/json',
        ),
      ),
    ),
  );

  // Repository
  serviceLocator.registerSingleton<PhotoRepository>(
    PhotoRepositoryImpl(
      unsplashApi: serviceLocator(),
    ),
  );

  // UseCase
  serviceLocator.registerSingleton<GetPhotosUseCase>(
    GetPhotosUseCase(
      photoRepository: serviceLocator(),
    ),
  );

  // Bloc
  serviceLocator.registerFactory<PhotosBloc>(
    () => PhotosBloc(
      getPhotosUseCase: serviceLocator(),
    ),
  );
}
