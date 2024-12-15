import 'package:flutter/material.dart';
import 'package:photostock_app/core/utils/context_ext.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';

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
                  url: photo.url,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 43,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      '< Back',
                      style: TextStyle(
                        color: context.theme.colorScheme.onPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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
                username: photo.username,
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
          style: TextStyle(
            color: context.theme.colorScheme.primary,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '$likes likes',
          style: TextStyle(
            color: context.theme.colorScheme.primary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
