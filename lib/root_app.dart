import 'package:flutter/material.dart';
import 'package:todo/config/navigation/app_navigation.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppNavigation.routerConfig,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: MediaQuery.of(context).textScaler.clamp(
                  minScaleFactor: 1.0,
                  maxScaleFactor: 2.0,
                ),
          ),
          child: child!,
        );
      },
    );
  }
}
