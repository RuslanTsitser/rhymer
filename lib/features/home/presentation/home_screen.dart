import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rhymer/router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onTap(index, TabsRouter tabsRouter) => tabsRouter.setActiveIndex(index);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
      routes: const [
        SearchRoute(),
        FavoritesRoute(),
        PoemsRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabRouter = AutoTabsRouter.of(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: theme.hintColor,
            selectedItemColor: theme.primaryColor,
            showUnselectedLabels: true,
            onTap: (index) => _onTap(index, tabRouter),
            currentIndex: tabRouter.activeIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Poems'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
          body: child,
        );
      },
    );
  }
}
