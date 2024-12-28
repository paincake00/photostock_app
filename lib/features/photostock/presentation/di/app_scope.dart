import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:photostock_app/core/constants/constants.dart';
import 'package:photostock_app/core/utils/wrappers/scaffold_messenger_wrapper.dart';
import 'package:photostock_app/features/photostock/data/remote/unsplash_api.dart';
import 'package:photostock_app/features/photostock/data/repository/photo_repository_impl.dart';
import 'package:photostock_app/features/photostock/domain/repository/photo_repository.dart';
import 'package:photostock_app/features/photostock/domain/usecases/get_photos.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/screens/photo_grid_screen/photo_grid_screen_model.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/screens/photo_grid_screen/photo_grid_screen_wm.dart';

/// App scope
class AppScope extends IAppScope {
  /// Unsplash API
  late final Dio _dio;

  /// Error handler
  late final ErrorHandler _errorHandler;

  /// Scaffold messenger wrapper
  late final ScaffoldMessengerWrapper _scaffoldMessengerWrapper;

  /// Photos use case factory
  late final GetPhotosUseCase _getPhotosUseCase = _photosUseCaseFactory();

  AppScope() {
    _dio = _initDio();
    _errorHandler = DefaultDebugErrorHandler();
    _scaffoldMessengerWrapper = ScaffoldMessengerWrapper();
  }

  @override
  PhotoGridScreenWM createPhotoGridScreenWM() {
    return PhotoGridScreenWM(
      _createPhotoGridScreenModel(),
      _scaffoldMessengerWrapper,
    );
  }

  /// Create photo grid screen model
  PhotoGridScreenModel _createPhotoGridScreenModel() {
    return PhotoGridScreenModel(
      _getPhotosUseCase,
      _errorHandler,
    );
  }

  /// Photos use case factory
  GetPhotosUseCase _photosUseCaseFactory() {
    return GetPhotosUseCase(
      photoRepository: _photoRepositoryFactory(),
    );
  }

  /// Photo repository factory
  PhotoRepository _photoRepositoryFactory() {
    return PhotoRepositoryImpl(
      unsplashApi: _unsplashApiFactory(),
    );
  }

  /// Unsplash API factory
  UnsplashApi _unsplashApiFactory() {
    return UnsplashApi(_dio);
  }

  /// Dio init
  Dio _initDio() {
    final dio = Dio();

    dio.options.contentType = UnsplashApiConstants.contentType;

    return dio;
  }
}

/// App dependencies
abstract class IAppScope {
  /// Create photo grid screen widget model
  PhotoGridScreenWM createPhotoGridScreenWM();
}
