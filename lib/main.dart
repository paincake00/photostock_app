import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:photostock_app/core/utils/context_ext.dart';
import 'package:photostock_app/features/photostock/presentation/di/app_scope.dart';
import 'package:photostock_app/features/photostock/presentation/di/app_scope_provider.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/screens/photo_grid_screen/photo_grid_screen.dart';
import 'package:photostock_app/features/photostock/presentation/widgets/uikit/theme/app_theme_data.dart';

/// Main app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  /// Run app
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// App scope
  late IAppScope _appScope;

  @override
  void initState() {
    super.initState();
    _appScope = AppScope();
  }

  @override
  Widget build(BuildContext context) {
    return AppScopeProvider(
      dependencies: _appScope,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.lightTheme,
        home: Scaffold(
          backgroundColor: context.theme.colorScheme.onPrimary,
          body: const PhotoGridScreen(),
        ),
      ),
    );
  }
}
