import 'package:aduanku/features/cases/pages/case_list_page.dart';
import 'package:aduanku/features/cases/pages/create_case_page.dart';
import 'package:aduanku/features/home/pages/home_page.dart';
import 'package:aduanku/features/information/pages/information_page.dart';
import 'package:aduanku/features/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) {
            return MainShell(navigationShell: navigationShell);
          },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) {
                return const HomePage();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/cases',
              name: 'cases',
              builder: (context, state) {
                return const CaseListPage();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/report',
              name: 'report',
              builder: (context, state) {
                return const CreateCasePage();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/information',
              name: 'information',
              builder: (context, state) {
                return const InformationPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) {
                return const ProfilePage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

class MainShell extends StatefulWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: widget._onDestinationSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.home),
            selectedIcon: Icon(Iconsax.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.document),
            selectedIcon: Icon(Iconsax.document),
            label: 'Cases',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.add),
            selectedIcon: Icon(Iconsax.add),
            label: 'Report',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.info_circle),
            selectedIcon: Icon(Iconsax.info_circle),
            label: 'Information',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.profile_circle),
            selectedIcon: Icon(Iconsax.profile_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
