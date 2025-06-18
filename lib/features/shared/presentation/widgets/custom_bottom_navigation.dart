import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomBottomNavigation({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: navigationShell.goBranch,
      // Theme
      indicatorColor: Theme.of(context).colorScheme.primary,
      destinations: [
        NavigationDestination(
          icon: Icon(
            Icons.camera_alt_outlined,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          selectedIcon: Icon(
            Icons.camera_alt_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          label: 'Live Feed',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.history,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          selectedIcon: Icon(
            Icons.history,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          label: 'History',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.people_alt_outlined,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          selectedIcon: Icon(
            Icons.people_alt_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          label: 'Individuals',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.settings_outlined,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          selectedIcon: Icon(
            Icons.settings_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
