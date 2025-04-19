import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:blogger/pages/article_screen.dart';
import 'package:blogger/pages/home_screen.dart';
import 'package:blogger/pages/login_screen.dart';
import 'package:blogger/pages/new_article_screen.dart';
import 'package:blogger/pages/onboarding_screen.dart';
import 'package:blogger/pages/profile_screen.dart';
import 'package:blogger/pages/splash_screen.dart';
import 'package:blogger/pages/story_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'article',
          builder: (BuildContext context, GoRouterState state) {
            return const ArticleScreen();
          },
        ),

        GoRoute(
          path: 'new_article',
          builder: (BuildContext context, GoRouterState state) {
            return const NewArticleScreen();
          },
        ),

        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          },
        ),
        GoRoute(
          path: 'story',
          builder: (BuildContext context, GoRouterState state) {
            return const StoryScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
