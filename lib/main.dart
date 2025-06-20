import 'package:flutter/material.dart';
import 'package:cvpr_face_recognition/config/config.dart';

void main() async {
  await ServiceLocator.init();
  await HumanFormats.initFormats();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Material App',
      theme: AppTheme.darkTheme,
    );
  }
}
