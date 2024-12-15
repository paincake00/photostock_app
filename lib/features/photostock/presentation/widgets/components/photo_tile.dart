import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:photostock_app/core/utils/context_ext.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/screens/photo_info.dart';

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
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          PhotoTileImage(
            photo: photo,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: PhotoTileText(
              username: photo.username,
              likes: photo.likes,
            ),
          ),
        ],
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
            color: Color(
              int.parse(
                '0xFF${photo.color.replaceAll('#', '')}',
              ),
            ).withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 0,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 2.5,
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
              image: photo.url,
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
          style: TextStyle(
            color: context.theme.colorScheme.onPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '$likes likes',
          style: TextStyle(
            color: context.theme.colorScheme.onPrimary,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
