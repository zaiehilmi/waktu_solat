import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KompasKiblat extends ConsumerWidget {
  AsyncSnapshot? snapshot;
  Widget preloadCompassImage;
  double? arahKiblat;

  KompasKiblat({
    super.key,
    required this.snapshot,
    required this.preloadCompassImage,
    required this.arahKiblat,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 300,
      width: 300,
      child: AnimatedRotation(
        duration: const Duration(milliseconds: 800),
        turns: (snapshot?.data?.turns ?? 0) / 360,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: preloadCompassImage,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedRotation(
                duration: const Duration(milliseconds: 500),
                turns: (arahKiblat ?? 0) / 360,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const VerticalDivider(
                    color: Colors.grey,
                    thickness: 5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
