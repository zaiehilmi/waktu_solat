import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:waktu_solat/models/waktu_solat_riverpod.dart';
import 'package:waktu_solat/services/kedudukan.dart';
import 'package:waktu_solat/theme/assets.dart';

import 'package:waktu_solat/theme/spacing.dart';
import 'package:waktu_solat/theme/dimension.dart';
import 'package:waktu_solat/utils/constant/tag_animasi.dart';
import 'package:waktu_solat/utils/navigation/nama_skrin.dart';
import 'package:waktu_solat/widgets/kotak_gradient.dart';
import 'package:waktu_solat/widgets/screen.dart';

class LamanUtama extends ConsumerWidget {
  const LamanUtama({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimension = DeviceDimension(context);
    tentukanKedudukan();

    return Screen(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Talian 24434',
              style: ThemeData.dark(useMaterial3: true)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 25),
            ),
            GestureDetector(
              onTap: () => context.go(NamaSkrin.waktuSolat),
              child: Stack(
                children: [
                  Hero(
                    tag: TagAnimasi.kotakWaktuSolat,
                    child: KotakGradient(),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Hero(
                      tag: TagAnimasi.lottieTeropong,
                      child: Lottie.asset(
                        AsetLottie.lelakiGunaTeleskop,
                        width: dimension.width / 1.8,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Spacing.xxl,
                    right: Spacing.xxxl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rujuk',
                          style: ThemeData.dark(useMaterial3: true)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        Hero(
                          tag: TagAnimasi.teksWaktuSolat,
                          child: Text(
                            'Waktu Solat',
                            style: ThemeData.dark(useMaterial3: true)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 40),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            KotakGradient(
              onTap: () => print('lala'),
              child: kandunganKotakKiblat(context),
            )
          ],
        ),
      ),
    );
  }
}

Widget kandunganKotakKiblat(BuildContext context) {
  final dimension = DeviceDimension(context);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Hero(
        tag: TagAnimasi.lottieKompas,
        child: Lottie.asset(
          AsetLottie.kompas,
          width: dimension.width / 2.4,
          fit: BoxFit.contain,
        ),
      ),
      Hero(tag: TagAnimasi.teksKiblat, child: teksLabelKiblat())
    ],
  );
}

Widget teksLabelKiblat() {
  return Text.rich(
    TextSpan(
      children: <InlineSpan>[
        TextSpan(
          text: 'mana ',
          style: ThemeData.dark(useMaterial3: true)
              .primaryTextTheme
              .bodySmall!
              .copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
        ),
        TextSpan(
          text: 'Kiblat ',
          style:
              ThemeData.dark(useMaterial3: true).primaryTextTheme.displayLarge,
        ),
        TextSpan(
          text: 'ni?',
          style: ThemeData.dark(useMaterial3: true)
              .primaryTextTheme
              .bodySmall!
              .copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    ),
  );
}
