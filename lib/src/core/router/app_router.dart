import 'package:go_router/go_router.dart';
import 'package:thrive/src/modules/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:thrive/src/modules/auth/presentation/pages/landing_screen.dart';
import 'package:thrive/src/modules/auth/presentation/login/pages/login_screen.dart';
import 'package:thrive/src/modules/auth/presentation/register/pages/register_screen.dart';

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