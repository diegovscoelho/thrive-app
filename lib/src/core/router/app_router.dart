import 'package:go_router/go_router.dart';
import 'package:thrive/src/presentation/dashboard/pages/dashboard_screen.dart';
import 'package:thrive/src/presentation/landing/pages/landing_screen.dart';
import 'package:thrive/src/presentation/login/pages/login_screen.dart';
import 'package:thrive/src/presentation/register/pages/register_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
);