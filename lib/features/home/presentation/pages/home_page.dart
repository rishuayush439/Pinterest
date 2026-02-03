// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const SafeArea(
//       child: Center(child: Text('Home Feed', style: TextStyle(fontSize: 18))),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../providers/home_provider.dart';
import '../widgets/pin_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinsAsync = ref.watch(homeProvider);

   return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: pinsAsync.when(
          data:
              (pins) => RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(homeProvider);
                },
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: pins.length,
                  itemBuilder: (context, index) {
                    return PinCard(pin: pins[index]);
                  },
                ),
              ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => const Center(child: Text('Something went wrong')),
        ),
      ),
    );

  }
}
