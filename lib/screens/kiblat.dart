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
import 'package:waktu_solat/widgets/kompas_kiblat.dart';
import 'package:waktu_solat/widgets/kotak_gradient.dart';
import 'package:waktu_solat/widgets/screen.dart';

class Kiblat extends ConsumerStatefulWidget {
  const Kiblat({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _KiblatState();
}

class _KiblatState extends ConsumerState<Kiblat> {
  @override
  void initState() {
    ref.read(getKiblatProvider);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = DeviceDimension(context).width;
    double? arahKiblat = ref.watch(kiblatProvider);
    debugPrint('arah kiblat dalam screen: $arahKiblat, $width');

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
          (arahKiblat == null)
              ? Lottie.asset(AsetLottie.jamPasir)
              : SmoothCompass(
                  rotationSpeed: 500,
                  height: 300,
                  width: 300,
                  compassBuilder: (context, snapshot, preloadCompassImage) =>
                      KompasKiblat(
                        snapshot: snapshot,
                        preloadCompassImage: preloadCompassImage,
                        arahKiblat: arahKiblat,
                      )),

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
                          .copyWith(
                              fontSize: (width < 400) ? 25 : 30,
                              fontWeight: FontWeight.w500),
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
