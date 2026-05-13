import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/main_screen.dart';
import 'screens/messages_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/discovery_screen.dart';
import 'screens/profile_screen.dart';
import 'second_page.dart';
import 'network_page.dart';
import 'screens/chat_detail_screen.dart';
import 'screens/category_detail_screen.dart';
import 'screens/category_items_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/messages',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/messages',
              builder: (context, state) => const MessagesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/categories',
              builder: (context, state) => const CategoriesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/discovery',
              builder: (context, state) => const DiscoveryScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/second',
      builder: (context, state) => const SecondPage(),
    ),
    GoRoute(
      path: '/network',
      builder: (context, state) => const NetworkPage(),
    ),
    GoRoute(
      path: '/category-detail',
      builder: (context, state) => const CategoryDetailScreen(),
    ),
    GoRoute(
      path: '/category-items/:name',
      builder: (context, state) {
        final name = state.pathParameters['name']!;
        return CategoryItemsScreen(categoryName: name);
      },
    ),
    GoRoute(
      path: '/chat-detail/:id/:title',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final title = state.pathParameters['title']!;
        return ChatDetailScreen(senderId: id, senderTitle: title);
      },
    ),
  ],
);
