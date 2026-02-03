import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkAuthBuilder(
      signedInBuilder: (context, authState) {
        final user = authState.user;

        if (user == null) {
          return const Center(child: CircularProgressIndicator());
        }

        
        final firstName = user.firstName ?? '';
        final lastName = user.lastName ?? '';
        final fullName =
            (firstName + ' ' + lastName).trim().isNotEmpty
                ? (firstName + ' ' + lastName).trim()
                : 'No name';

       
        final email =
            (user.emailAddresses?.isNotEmpty ?? false)
                ? user.emailAddresses!.first.emailAddress
                : '';

        return SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),

             CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  user.imageUrl ?? 'https://i.pravatar.cc/150?img=3',
                ),
              ),


              const SizedBox(height: 12),

              Text(
                fullName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(email, style: TextStyle(color: Colors.grey.shade600)),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _ProfileStat(label: 'Pins', value: '0'),
                  _ProfileStat(label: 'Followers', value: '0'),
                  _ProfileStat(label: 'Following', value: '0'),
                ],
              ),

              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: () async {
                  await authState.signOut();
                },
                child: const Text('Log out'),
              ),
            ],
          ),
        );
      },
      signedOutBuilder: (context, _) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}
