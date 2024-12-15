import 'package:flutter/material.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/components/photo_tile.dart';

/// Photos grid
class PhotosGrid extends StatefulWidget {
  /// Photos for grid
  final List<PhotoEntity> photos;

  /// Is loading new photos
  final bool isLoading;

  /// Function to load new photos
  final Function onLoading;

  const PhotosGrid({
    super.key,
    required this.photos,
    required this.isLoading,
    required this.onLoading,
  });

  @override
  State<PhotosGrid> createState() => _PhotosGridState();
}

/// Photos grid state
class _PhotosGridState extends State<PhotosGrid> {
  /// Scroll controller
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          widget.onLoading();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView.builder(
                  controller: _scrollController,
                  itemCount: widget.photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => PhotoTile(
                    photo: widget.photos[index],
                  ),
                ),
              ),
            ),
          ],
        ),
        if (widget.isLoading)
          Positioned(
            bottom: 8,
            left: MediaQuery.of(context).size.width / 2 - 27.5,
            child: SizedBox(
              width: 55,
              height: 55,
              child: Image.asset('assets/images/spinner.gif'),
            ),
          ),
      ],
    );
  }
}