// import 'package:flutter/material.dart';
// import 'package:clerk_flutter/clerk_flutter.dart';

// class AuthGate extends StatelessWidget {
//   final Widget child;

//   const AuthGate({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return ClerkAuthBuilder(
//       signedInBuilder: (context, _) {
//         // ✅ User signed in → show app
//         return child;
//       },
//       signedOutBuilder: (context, _) {
//         // ❌ User signed out → show Clerk Sign In
//         return const Scaffold(body: Center(child: ClerkSignIn()));
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class AuthGate extends StatelessWidget {
  final Widget child;

  const AuthGate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClerkAuthBuilder(
      signedInBuilder: (context, authState) {
        // ✅ User signed in
        return child;
      },
      signedOutBuilder: (context, authState) {
        // ❌ User signed out → Clerk login UI
        return const Scaffold(body: SafeArea(child: ClerkAuthentication()));
      },
    );
  }
}
