import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:photostock_app/features/photostock/presentation/bloc/photos/photos_bloc.dart';
import 'package:photostock_app/features/photostock/presentation/bloc/photos/photos_event.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/screens/home_screen.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/uikit/theme/app_theme_data.dart';
import 'package:photostock_app/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<PhotosBloc>()
        ..add(
          const GetPhotosEvent(page: 1),
        ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
