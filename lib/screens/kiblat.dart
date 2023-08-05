import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';
import 'package:waktu_solat/models/kiblat_riverpod.dart';
import 'package:waktu_solat/models/state_provider.dart';
import 'package:waktu_solat/theme/assets.dart';
import 'package:waktu_solat/theme/dimension.dart';
import 'package:waktu_solat/theme/spacing.dart';
import 'package:waktu_solat/utils/constant/tag_animasi.dart';
import 'package:waktu_solat/utils/navigation/nama_skrin.dart';
import 'package:waktu_solat/widgets/kotak_gradient.dart';
import 'package:waktu_solat/widgets/screen.dart';

class Kiblat extends ConsumerWidget {
  const Kiblat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final dimension = DeviceDimension(context);
    ref.watch(getKiblatProvider);
    double? arahKiblat = ref.watch(kiblatProvider);
    debugPrint('arah kiblat dalam screen: $arahKiblat');

    return Screen(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Hero(
            tag: TagAnimasi.teksKiblat,
            child: Text(
              'Kiblat',
              style: ThemeData.dark(useMaterial3: true).textTheme.bodyLarge,
            ),
          ),
          SmoothCompass(
            rotationSpeed: 500,
            height: 300,
            width: 300,
            compassBuilder: (context, snapshot, preloadCompassImage) =>
                SizedBox(
              height: 300,
              width: 300,
              child: AnimatedRotation(
                duration: const Duration(milliseconds: 800),
                turns: snapshot?.data?.turns ?? 0,
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
                        turns: arahKiblat ?? 0 / 360,
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
            ),
          ),

          // butang waktu solat
          GestureDetector(
            onTap: () => context.go(NamaSkrin.waktuSolat),
            child: Stack(
              children: [
                Hero(
                  tag: TagAnimasi.kotakKiblat,
                  child: KotakGradient(
                    height: 100,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: Spacing.xxxl,
                  child: Hero(
                    tag: TagAnimasi.lottieKompas,
                    child: Lottie.asset(
                      AsetLottie.lelakiGunaTeleskop,
                      height: 100,
                      repeat: false,
                    ),
                  ),
                ),
                Positioned(
                  top: Spacing.xxxl + 15,
                  left: Spacing.xxl + 130,
                  child: Hero(
                    tag: TagAnimasi.teksWaktuSolat,
                    child: Text(
                      'Waktu Solat',
                      style: ThemeData.dark(useMaterial3: true)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
