import 'package:blogs_app/pages/article_screen.dart';
import 'package:blogs_app/pages/home_screen.dart';
import 'package:blogs_app/pages/login_screen.dart';
import 'package:blogs_app/pages/new_article_screen.dart';
import 'package:blogs_app/pages/onboarding_screen.dart';
import 'package:blogs_app/pages/profile_screen.dart';
import 'package:blogs_app/pages/register_screen.dart';
import 'package:blogs_app/pages/splash_screen.dart';
import 'package:blogs_app/pages/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
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
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: 'new_article',
          builder: (BuildContext context, GoRouterState state) {
            return const NewArticleScreen();
          },
        ),
        GoRoute(
          path: 'onboarding',
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingScreen();
          },
        ),
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          },
        ),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterScreen();
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
