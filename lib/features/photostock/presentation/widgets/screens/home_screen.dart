import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late final List<PhotoEntity> allPhotos;

  /// Current page
  late int page;

  @override
  void initState() {
    allPhotos = [];
    page = 2;

    super.initState();
  }

  /// Load new page
  void loadNewPage(int page) {
    context.read<PhotosBloc>().add(
          GetPhotosEvent(
            page: page,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photos',
          style: TextStyle(
            color: context.theme.colorScheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
          ),
        ),
      ),
      body: BlocBuilder<PhotosBloc, PhotosState>(
        builder: (context, state) {
          if (state is PhotosLoading) {
            return PhotosGrid(
              photos: allPhotos,
              isLoading: true,
              onLoading: () => loadNewPage(page),
            );
          }
          if (state is PhotosDone) {
            final photos = state.data;
            if (photos != null) {
              allPhotos.addAll(photos);
              page++;
            }
            return PhotosGrid(
              photos: allPhotos,
              isLoading: false,
              onLoading: () => loadNewPage(page),
            );
          }
          if (state is PhotosError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error.toString(),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
