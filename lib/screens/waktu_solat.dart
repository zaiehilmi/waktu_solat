import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:waktu_solat/services/api/esolat_api.dart';
import 'package:waktu_solat/services/kedudukan.dart';
import 'package:waktu_solat/theme/assets.dart';
import 'package:waktu_solat/theme/spacing.dart';
import 'package:waktu_solat/utils/class/esolat.dart';
import 'package:waktu_solat/utils/constant/eSolat.dart';
import 'package:waktu_solat/utils/constant/tag_animasi.dart';
import 'package:waktu_solat/utils/jarak_terpendek.dart';
import 'package:waktu_solat/utils/navigation/nama_skrin.dart';
import 'package:waktu_solat/widgets/kotak_gradient.dart';
import 'package:waktu_solat/widgets/screen.dart';

class JadualWaktuSolat extends ConsumerWidget {
  const JadualWaktuSolat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final koordinat = ref.watch(tentukanKedudukanProvider);
    final zonWaktuSolat = ref.watch(cariZonTerdekatProvider);

    final waktuSolat = ref.watch(getWaktuSolatHariIniProvider(
      tempohJadual: TempohJadual.week,
      zonWaktuSolat: ZonWaktuSolat.JHR02,
    ));

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
          waktuSolat.when(
            data: (data) => jadualWaktuSolat(data!),
            error: (error, trace) => Text(
              'lala: $error$trace',
              style: const TextStyle(fontSize: 20),
            ),
            loading: () => Lottie.asset(
              AsetLottie.jamPasir,
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

Widget jadualWaktuSolat(ESolat data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      lajurJadual(),
      lajurJadual(data: data),
    ],
  );
}

Widget lajurJadual({ESolat? data}) {
  TextStyle gayaLabel = ThemeData.dark(useMaterial3: true)
      .textTheme
      .bodyLarge!
      .copyWith(
          fontSize: 30,
          color: ThemeData.dark(useMaterial3: true).secondaryHeaderColor);

  TextStyle gayaData = ThemeData.dark(useMaterial3: true)
      .primaryTextTheme
      .bodyLarge!
      .copyWith(fontSize: 30);

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
