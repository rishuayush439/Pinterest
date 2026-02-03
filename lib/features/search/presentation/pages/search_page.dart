
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:pinterest/features/home/presentation/providers/search_provider.dart';


class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final searchResult = ref.watch(searchPinsProvider(query));

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            /// 🔍 Search Bar (TRIGGERS API)
            TextField(
              onChanged: (value) {
                setState(() {
                  query = value.trim();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for ideas',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// 🏷 Category Chips (Optional trigger)
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _CategoryChip(label: 'Art', onTap: _onChipTap),
                  _CategoryChip(label: 'Coding', onTap: _onChipTap),
                  _CategoryChip(label: 'Design', onTap: _onChipTap),
                  _CategoryChip(label: 'Fashion', onTap: _onChipTap),
                  _CategoryChip(label: 'Travel', onTap: _onChipTap),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// 📸 Search Results (API OUTPUT)
            Expanded(
              child: searchResult.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error:
                    (e, _) => const Center(child: Text('Something went wrong')),
                data: (pins) {
                  if (query.isEmpty) {
                    return Center(
                      child: Text(
                        'Search results appear here',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    );
                  }

                  if (pins.isEmpty) {
                    return const Center(child: Text('No results found'));
                  }

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: pins.length,
                    itemBuilder: (_, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: pins[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Called when a category chip is tapped
  void _onChipTap(String value) {
    setState(() {
      query = value;
    });
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final Function(String) onTap;

  const _CategoryChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () => onTap(label),
        child: Chip(label: Text(label), backgroundColor: Colors.grey.shade200),
      ),
    );
  }
}
