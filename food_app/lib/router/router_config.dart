import 'package:food_app/screens/restaurant_details_screen.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/screens/signup_screen.dart';
import 'package:food_app/screens/verification_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerConfig = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => const LoginScreen(), routes: <RouteBase>[
      GoRoute(path: 'signup', builder: (context, state) => const SignupScreen()),
      GoRoute(path: 'verification', builder: (context, state) => const VerificationScreen()),
      GoRoute(path: 'home', builder: (context, state) => const HomeScreen()),
      GoRoute(path: 'details', builder: (context, state) => const RestaurantDetailsScreen()),
    ]),
  ],
);
