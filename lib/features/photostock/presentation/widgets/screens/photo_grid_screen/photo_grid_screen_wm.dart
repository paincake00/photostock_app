import 'dart:async';

import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock_app/core/utils/wrappers/scaffold_messenger_wrapper.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';
import 'package:photostock_app/features/photostock/presentation/di/app_scope_provider.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/screens/photo_grid_screen/photo_grid_screen.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/screens/photo_grid_screen/photo_grid_screen_model.dart';
import 'package:union_state/union_state.dart';

/// Photo grid screen widget model factory
PhotoGridScreenWM photoGridScreenWMFactory(BuildContext context) {
  final dependencies = AppScopeProvider.of(context);
  return dependencies.createPhotoGridScreenWM();
}

/// Photo grid screen widget model
class PhotoGridScreenWM
    extends WidgetModel<PhotoGridScreen, PhotoGridScreenModel>
    implements IPhotoGridWM {
  PhotoGridScreenWM(
    super.model,
    this._scaffoldMessengerWrapper,
  );

  /// Scaffold messenger wrapper
  final ScaffoldMessengerWrapper _scaffoldMessengerWrapper;

  /// Photos state
  final _photosState = UnionStateNotifier<List<PhotoEntity>>.loading();
  // late final ScrollController _scrollController;
  final _scrollController = ScrollController();

  /// Page number
  int _page = 1;

  @override
  UnionStateNotifier<List<PhotoEntity>> get photosState => _photosState;
  @override
  ScrollController get scrollController => _scrollController;

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _scrollController.addListener(
      _scrollEndListener,
    );
    unawaited(_loadPhotos());
  }

  @override
  void dispose() {
    _photosState.dispose();
    _scrollController.removeListener(
      _scrollEndListener,
    );

    super.dispose();
  }

  /// Scroll end listener
  void _scrollEndListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      unawaited(_loadPhotos());
    }
  }

  @override
  void onErrorHandle(Object error) {
    super.onErrorHandle(error);

    if (error is DioException &&
        (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout)) {
      _scaffoldMessengerWrapper.showSnackBar(context, 'Connection troubles');
    }
  }

  /// Load photos
  Future<void> _loadPhotos() async {
    final previousData = _photosState.value.data;
    _photosState.loading(previousData);

    try {
      final newPhotos = await model.getPhotos(_page);
      _page++;
      if (previousData != null) {
        previousData.addAll(newPhotos);
        _photosState.content(previousData);
      } else {
        _photosState.content(newPhotos);
      }
    } on Exception catch (e) {
      _photosState.failure(e, previousData);
    }
  }
}

abstract interface class IPhotoGridWM implements IWidgetModel {
  /// Photos state
  UnionStateNotifier<List<PhotoEntity>> get photosState;

  /// Scroll controller
  ScrollController get scrollController;
}
