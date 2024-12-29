import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock_app/core/utils/layout/calculator_constraints.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/components/photos_grid.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/screens/photo_grid_screen/photo_grid_screen_wm.dart';
import 'package:union_state/union_state.dart';

/// Photo grid screen
class PhotoGridScreen extends ElementaryWidget<IPhotoGridWM> {
  const PhotoGridScreen({
    Key? key,
    WidgetModelFactory wmFactory = photoGridScreenWMFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPhotoGridWM wm) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenWidth = CalculatorConstraints.calculateConstraintedWidth(
        constraints.maxWidth,
      );
      return UnionStateListenableBuilder<List<PhotoEntity>>(
        unionStateListenable: wm.photosState,
        loadingBuilder: (context, data) => PhotosGrid(
          photos: data ?? [],
          isLoading: wm.isLoading,
          scrollController: wm.scrollController,
          screenWidth: screenWidth,
        ),
        failureBuilder: (context, error, child) => PhotosGrid(
          photos: const [],
          isLoading: wm.isLoading,
          scrollController: wm.scrollController,
          screenWidth: screenWidth,
        ),
        builder: (context, data) => PhotosGrid(
          photos: data,
          isLoading: wm.isLoading,
          scrollController: wm.scrollController,
          screenWidth: screenWidth,
        ),
      );
    });
  }
}
