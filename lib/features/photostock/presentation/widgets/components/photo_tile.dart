import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:photostock_app/core/utils/context_ext.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/screens/photo_info.dart';
import 'package:photostock_app/core/utils/color_ext.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/uikit/text/app_text_style.dart';

/// Photo tile
class PhotoTile extends StatelessWidget {
  /// [photo] is required
  final PhotoEntity photo;

  const PhotoTile({
    required this.photo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            PhotoTileImage(
              photo: photo,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: PhotoTileText(
                username: photo.user.username,
                likes: photo.likes,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Photo tile image
class PhotoTileImage extends StatelessWidget {
  /// [photo] is required
  final PhotoEntity photo;

  const PhotoTileImage({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ColorExt.fromHex(photo.color).withValues(
              alpha: 0.5,
            ),
            blurRadius: 10,
            spreadRadius: 0,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoInfo(
                    photo: photo,
                  ),
                ),
              );
            },
            child: BlurHash(
              image: photo.url.regular,
              hash: photo.blurHash,
              imageFit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

/// Photo tile text
class PhotoTileText extends StatelessWidget {
  /// Username
  final String username;

  /// Likes
  final int likes;

  const PhotoTileText({
    super.key,
    required this.username,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          username,
          style: AppTextStyle.titleMedium.value.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
        Text(
          '$likes likes',
          style: AppTextStyle.titleSmall.value.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}
