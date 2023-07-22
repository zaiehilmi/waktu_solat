import 'package:go_router/go_router.dart';
import 'package:waktu_solat/screens/laman_utama.dart';
import 'package:waktu_solat/screens/waktu_solat.dart';
import 'package:waktu_solat/utils/constant/nama_skrin.dart';

// langkah untuk tambah skrin:
// 1. tambah dalam `utils/nama_skrin.dart`
// 2. update `initRoutes()`
// 3. tambah screen handler

final penghala = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: NamaSkrin.mula,
      builder: (context, state) => const LamanUtama(),
    ),
    GoRoute(
      path: NamaSkrin.waktuSolat,
      builder: (context, state) => const JadualWaktuSolat(),
    ),
  ],
);
