// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../features/home/presentation/pages/home_page.dart';
// import '../features/search/presentation/pages/search_page.dart';
// import '../features/profile/presentation/pages/profile_page.dart';
// import '../features/pin_detail/presentation/pages/pin_detail_page.dart';
// import '../main_scaffold.dart';
// import '../features/home/domain/entities/pin.dart';
// import '../features/auth/presentation/auth_gate.dart';


// final GoRouter appRouter = GoRouter(
//   initialLocation: '/',
//   routes: [
//     ShellRoute(
//       builder: (context, state, child) {
//         return MainScaffold(child: child);
//       },
//       routes: [
//         GoRoute(path: '/', builder: (context, state) => const HomePage()),
//         GoRoute(
//           path: '/search',
//           builder: (context, state) => const SearchPage(),
//         ),
//         GoRoute(
//           path: '/profile',
//           builder: (context, state) => const ProfilePage(),
//         ),
//       ],
//     ),

//     // Pin Detail (full screen)
//   GoRoute(
//       path: '/pin',
//       builder: (context, state) {
//         final pin = state.extra as Pin;
//         return PinDetailPage(pin: pin);
//       },
//     ),
//   ],
// );



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/search/presentation/pages/search_page.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../features/pin_detail/presentation/pages/pin_detail_page.dart';
import '../features/home/domain/entities/pin.dart';
import '../features/auth/presentation/auth_gate.dart';
import '../main_scaffold.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        // 🔐 AUTH ENFORCED HERE
        return AuthGate(child: MainScaffold(child: child));
          //return MainScaffold(child: child);
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomePage()),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),

    // Pin Detail (full screen, outside shell)
    GoRoute(
      path: '/pin',
      builder: (context, state) {
        final pin = state.extra as Pin;
        return PinDetailPage(pin: pin);
      },
    ),
  ],
);
