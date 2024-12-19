import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photostock_app/core/constants/constants.dart';
import 'package:photostock_app/core/utils/context_ext.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';
import 'package:photostock_app/features/photostock/presentation/bloc/photos/photos_bloc.dart';
import 'package:photostock_app/features/photostock/presentation/bloc/photos/photos_event.dart';
import 'package:photostock_app/features/photostock/presentation/bloc/photos/photos_state.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/components/photos_grid.dart';

/// Home screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// All photos on screen
  late final List<PhotoEntity> _allPhotos;

  /// Current page
  late int _page;

  /// Scroll controller
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _allPhotos = [];
    _page = 2;

    _scrollController = ScrollController();
    _scrollController.addListener(
      scrollEndListener,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(
      scrollEndListener,
    );
    _scrollController.dispose();
    super.dispose();
  }

  /// Scroll end listener
  void scrollEndListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      loadNewPage(_page);
    }
  }

  /// Load new page
  void loadNewPage(int page) {
    context.read<PhotosBloc>().add(
          GetPhotosEvent(
            page: page,
          ),
        );
  }

  /// Calculate constrainted width
  double _calculateConstraintedWidth(double screenWidth) {
    return (screenWidth > ScreenConstants.desktopWidthStart
            ? screenWidth * ScreenConstants.largeScreenPercentage
            : screenWidth)
        .clamp(0, ScreenConstants.maxWidth);
  }

  /// Show snack bar
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.onPrimary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = _calculateConstraintedWidth(
            constraints.maxWidth,
          );

          return BlocBuilder<PhotosBloc, PhotosState>(
            builder: (context, state) {
              if (state is PhotosLoading) {
                return PhotosGrid(
                  photos: _allPhotos,
                  isLoading: true,
                  scrollController: _scrollController,
                  screenWidth: screenWidth,
                );
              }
              if (state is PhotosDone) {
                final photos = state.data;
                if (photos != null) {
                  _allPhotos.addAll(photos);
                  _page++;
                }
                return PhotosGrid(
                  photos: _allPhotos,
                  isLoading: false,
                  scrollController: _scrollController,
                  screenWidth: screenWidth,
                );
              }
              if (state is PhotosError) {
                _showSnackBar(
                  context,
                  state.error.toString(),
                );
              }
              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}
