import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock_app/core/constants/constants.dart';
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

  /// Calculate constrainted width
  double _calculateConstraintedWidth(double screenWidth) {
    return (screenWidth > ScreenConstants.desktopWidthStart
            ? screenWidth * ScreenConstants.largeScreenPercentage
            : screenWidth)
        .clamp(0, ScreenConstants.maxWidth);
  }

  @override
  Widget build(IPhotoGridWM wm) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenWidth = _calculateConstraintedWidth(
        constraints.maxWidth,
      );
      return UnionStateListenableBuilder<List<PhotoEntity>>(
        unionStateListenable: wm.photosState,
        loadingBuilder: (context, data) => PhotosGrid(
          photos: data ?? [],
          isLoading: true,
          scrollController: wm.scrollController,
          screenWidth: screenWidth,
        ),
        failureBuilder: (context, error, child) => const _ErrorWidget(),
        builder: (context, data) => PhotosGrid(
          photos: data,
          isLoading: false,
          scrollController: wm.scrollController,
          screenWidth: screenWidth,
        ),
      );
    });
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Something went wrong'),
    );
  }
}
