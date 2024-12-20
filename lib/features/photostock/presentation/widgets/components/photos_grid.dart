import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:photostock_app/core/constants/constants.dart';
import 'package:photostock_app/core/utils/context_ext.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/components/photo_tile.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/uikit/text/app_text_style.dart';

/// Photos grid
class PhotosGrid extends StatelessWidget {
  /// Photos for grid
  final List<PhotoEntity> _photos;

  /// Is loading new photos
  final bool _isLoading;

  /// Scroll controller
  final ScrollController _scrollController;

  /// Screen width
  final double _screenWidth;

  const PhotosGrid({
    super.key,
    required List<PhotoEntity> photos,
    required bool isLoading,
    required ScrollController scrollController,
    required double screenWidth,
  })  : _isLoading = isLoading,
        _photos = photos,
        _scrollController = scrollController,
        _screenWidth = screenWidth;

  /// Calculate columns count
  int _calculateColumnsCount(double screenWidth) {
    return screenWidth > ScreenConstants.desktopWidthStart ? 4 : 2;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: _screenWidth,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverPersistentHeaderDelegate(),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  sliver: SliverGrid.builder(
                    itemCount: _photos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _calculateColumnsCount(
                        _screenWidth,
                      ),
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) => PhotoTile(
                      photo: _photos[index],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isLoading)
          Positioned(
            bottom: MediaQuery.of(context).size.height / 2 - 36,
            left: MediaQuery.of(context).size.width / 2 - 12,
            child: const CupertinoActivityIndicator(),
          ),
      ],
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 100;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: AnimatedContainer(
          color: context.theme.colorScheme.onPrimary.withValues(alpha: 0.85),
          duration: const Duration(
            milliseconds: 300,
          ),
          alignment: shrinkOffset <= 35
              ? Alignment.bottomLeft
              : Alignment.bottomCenter,
          padding: shrinkOffset <= 35
              ? const EdgeInsets.only(
                  left: 27,
                  top: 64,
                  bottom: 10,
                )
              : const EdgeInsets.only(
                  top: 37,
                  bottom: 10,
                ),
          child: Text(
            TextConstants.appBarHeadText,
            style: AppTextStyle.bodyMedium.value.copyWith(
              color: context.theme.colorScheme.primary,
              fontSize: shrinkOffset <= 35 ? 24 : 20,
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
