import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cvpr_face_recognition/features/shared/shared.dart';

class RootScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const RootScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavigation(
        navigationShell: navigationShell,
      ),
    );
  }
}
