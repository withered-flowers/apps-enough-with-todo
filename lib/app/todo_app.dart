import 'package:enough_with_todo/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:enough_with_todo/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routesProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.materialLight,
      routerConfig: routeConfig,
    );
  }
}
