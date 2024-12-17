import 'package:flutter/material.dart';
import 'package:photostock_app/core/constants/constants.dart';
import 'package:photostock_app/core/utils/context_ext.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/uikit/text/app_text_style.dart';

/// Photo info screen
class PhotoInfo extends StatelessWidget {
  /// Photo entity for info
  final PhotoEntity photo;

  const PhotoInfo({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                PhotoInfoImage(
                  url: photo.url.regular,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 43,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      TextConstants.goBackText,
                      style: AppTextStyle.titleLargeW500.value.copyWith(
                        color: context.theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 26,
                top: 21,
              ),
              child: PhotoInfoText(
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

/// Photo info image
class PhotoInfoImage extends StatelessWidget {
  /// Url for image
  final String url;

  const PhotoInfoImage({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.3,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// Photo info text
class PhotoInfoText extends StatelessWidget {
  /// Username
  final String username;

  /// Likes
  final int likes;

  const PhotoInfoText({
    super.key,
    required this.username,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          username,
          style: AppTextStyle.bodyLarge.value.copyWith(
            color: context.theme.colorScheme.primary,
          ),
        ),
        Text(
          '$likes likes',
          style: AppTextStyle.titleLargeW700.value.copyWith(
            color: context.theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
