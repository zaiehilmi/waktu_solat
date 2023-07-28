import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:waktu_solat/models/state_provider.dart';
import 'package:waktu_solat/models/waktu_solat_riverpod.dart';
import 'package:waktu_solat/theme/assets.dart';
import 'package:waktu_solat/theme/spacing.dart';
import 'package:waktu_solat/utils/class/esolat.dart';
import 'package:waktu_solat/utils/constant/tag_animasi.dart';
import 'package:waktu_solat/utils/navigation/nama_skrin.dart';
import 'package:waktu_solat/widgets/kotak_gradient.dart';
import 'package:waktu_solat/widgets/screen.dart';

class JadualWaktuSolat extends ConsumerWidget {
  const JadualWaktuSolat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(waktuSolatProvider);

    return Screen(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Hero(
            tag: TagAnimasi.teksWaktuSolat,
            child: Text(
              'Waktu Solat',
              style: ThemeData.dark(useMaterial3: true).textTheme.bodyLarge,
            ),
          ),
          ref.watch(jadualWaktuSolatProvider) == null
              ? Lottie.asset(AsetLottie.jamPasir)
              : SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ref.watch(namaBandarProvider) ?? 'Tidak diketahui',
                            style: ThemeData.dark(useMaterial3: true)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  fontSize: 18,
                                  color: ThemeData.dark(useMaterial3: true)
                                      .primaryTextTheme
                                      .labelSmall!
                                      .color,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          SizedBox(width: Spacing.md),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.purple.shade100,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Text(
                                ref.watch(zonWaktuSolatProvider)?.name ??
                                    'Tidak diketahui',
                                style: ThemeData.dark(useMaterial3: true)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 14,
                                        color: Colors.purple.shade900),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      _jadualWaktuSolat(ref.watch(jadualWaktuSolatProvider)!),
                    ],
                  ),
                ),
          GestureDetector(
            onTap: () => context.go(NamaSkrin.mula),
            child: Stack(
              children: [
                Hero(
                  tag: TagAnimasi.kotakKiblat,
                  child: KotakGradient(
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
                  top: Spacing.xxxl + 15,
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
          ),
        ],
      ),
    );
  }
}

Widget _jadualWaktuSolat(ESolat data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _lajurJadual(),
      _lajurJadual(data: data),
    ],
  );
}

Widget _lajurJadual({ESolat? data}) {
  TextStyle gayaLabel = ThemeData.dark(useMaterial3: true)
      .textTheme
      .bodyLarge!
      .copyWith(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: ThemeData.dark(useMaterial3: true).secondaryHeaderColor);

  TextStyle gayaData =
      ThemeData.dark(useMaterial3: true).primaryTextTheme.bodyLarge!.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          );

  const double gap = 30;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(data?.subuh ?? 'Subuh',
          style: (data != null) ? gayaData : gayaLabel),
      const SizedBox(height: gap),
      Text(data?.syuruk ?? 'Syuruk',
          style: (data != null) ? gayaData : gayaLabel),
      const SizedBox(height: gap),
      Text(data?.zohor ?? 'Zohor',
          style: (data != null) ? gayaData : gayaLabel),
      const SizedBox(height: gap),
      Text(data?.asar ?? 'Asar', style: (data != null) ? gayaData : gayaLabel),
      const SizedBox(height: gap),
      Text(data?.maghrib ?? 'Maghrib',
          style: (data != null) ? gayaData : gayaLabel),
      const SizedBox(height: gap),
      Text(data?.isyak ?? 'Isyak',
          style: (data != null) ? gayaData : gayaLabel),
    ],
  );
}
