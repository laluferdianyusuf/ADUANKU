import 'package:aduanku/app/router/app_router.dart';
import 'package:aduanku/app/theme/app_theme.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';

class Aduanku extends StatelessWidget {
  const Aduanku({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Aduanku',
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
