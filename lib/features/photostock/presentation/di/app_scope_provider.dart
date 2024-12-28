import 'package:flutter/material.dart';
import 'package:photostock_app/features/photostock/presentation/di/app_scope.dart';

/// App scope provider
class AppScopeProvider extends InheritedWidget {
  /// Dependencies
  final IAppScope dependencies;

  const AppScopeProvider({
    super.key,
    required this.dependencies,
    required super.child,
  });

  /// Get dependencies
  static IAppScope of(BuildContext context) {
    final result = context.getInheritedWidgetOfExactType<AppScopeProvider>();
    assert(result != null, 'No AppScopeProvider found in context');
    return result!.dependencies;
  }

  @override
  bool updateShouldNotify(AppScopeProvider oldWidget) {
    return oldWidget.dependencies != dependencies;
  }
}
