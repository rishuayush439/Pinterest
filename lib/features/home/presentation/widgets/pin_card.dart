import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/pin.dart';

class PinCard extends StatelessWidget {
  final Pin pin;

  const PinCard({super.key, required this.pin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         HapticFeedback.lightImpact();
        context.push(
          '/pin',
          extra: pin,
        );
      },
      child: Hero(
        tag: pin.id,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: pin.imageUrl,
                placeholder: (_, __) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(height: 200, color: Colors.white),
                ),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  pin.photographer,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
