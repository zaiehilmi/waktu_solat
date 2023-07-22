import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:waktu_solat/theme/assets.dart';
import 'package:waktu_solat/theme/spacing.dart';
import 'package:waktu_solat/utils/constant/tag_animasi.dart';
import 'package:waktu_solat/utils/navigation/nama_skrin.dart';
import 'package:waktu_solat/widgets/kotak_gradient.dart';
import 'package:waktu_solat/widgets/screen.dart';

class JadualWaktuSolat extends ConsumerWidget {
  const JadualWaktuSolat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Screen(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('data'),
          Stack(
            children: [
              Hero(
                tag: TagAnimasi.kotakKiblat,
                child: KotakGradient(
                  onTap: () => context.go(NamaSkrin.mula),
                  height: 100,
                ),
              ),
              Positioned(
                top: 40,
                left: Spacing.xxl,
                child: Hero(
                  tag: TagAnimasi.lottieKompas,
                  child: Lottie.asset(
                    AsetLottie.kompas,
                    height: 120,
                    repeat: false,
                  ),
                ),
              ),
              Positioned(
                top: Spacing.xxxl + 10,
                left: Spacing.xxl + 130,
                child: Hero(
                  tag: TagAnimasi.teksKiblat,
                  child: Text(
                    'Kiblat',
                    style: ThemeData.dark(useMaterial3: true)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 35, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // @override
  // ConsumerState<ConsumerStatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
}
