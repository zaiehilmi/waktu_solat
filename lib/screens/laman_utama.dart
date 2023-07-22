import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:waktu_solat/theme/assets.dart';

import 'package:waktu_solat/theme/color.dart';
import 'package:waktu_solat/theme/spacing.dart';
import 'package:waktu_solat/theme/dimension.dart';
import 'package:waktu_solat/utils/constant/nama_skrin.dart';
import 'package:waktu_solat/widgets/Screen.dart';

class LamanUtama extends ConsumerWidget {
  const LamanUtama({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimension = DeviceDimension(context);

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
                  kotak(context),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Lottie.asset(
                      AsetLottie.lelakiGunaTeleskop,
                      width: dimension.width / 1.8,
                      fit: BoxFit.contain,
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
                        Text(
                          'Waktu Solat',
                          style: ThemeData.dark(useMaterial3: true)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kotak(context,
                onTap: () => print('lala'),
                child: kandunganKotakKiblat(context))
          ],
        ),
      ),
    );
  }
}

Widget kotak(BuildContext context, {Widget? child, Function()? onTap}) {
  final dimension = DeviceDimension(context);

  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: dimension.width / 1.3,
      height: dimension.height / 3.5,
      margin: EdgeInsets.all(Spacing.xxl),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(CustomColors.bighead.color_1),
            Color(CustomColors.bighead.color_2),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xff4b134f),
            spreadRadius: 0,
            blurRadius: 25,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: (child),
    ),
  );
}

Widget kandunganKotakKiblat(BuildContext context) {
  final dimension = DeviceDimension(context);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Lottie.asset(
        AsetLottie.kompas,
        width: dimension.width / 2.4,
        fit: BoxFit.contain,
      ),
      teksLabelKiblat()
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
