import 'package:aeroplanner_app/router/router.dart';
import 'package:flutter/material.dart';

class AeroPlannerApp extends StatelessWidget {
  AeroPlannerApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Roboto'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
