import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waktu_solat/models/state_provider.dart';
import 'package:waktu_solat/services/api/esolat_api.dart';
import 'package:waktu_solat/services/api/nominatim_api.dart';
import 'package:waktu_solat/services/kedudukan.dart';
import 'package:waktu_solat/utils/class/koordinat.dart';
import 'package:waktu_solat/utils/tentukan_zon.dart';

final waktuSolatProvider = FutureProvider<void>((ref) async {
  // proses dapatkan koordinat semasa peranti
  await tentukanKedudukan().then((value) {
    debugPrint('==> ${value!.longitud}');
    ref.read(koordinatSemasaProvider.notifier).update((_) => Koordinat(
          latitud: value.latitud,
          longitud: value.longitud,
        ));
  });

  // proses dapatkan nama bandar
  await namaBandarViaNominatimApi(ref.watch(koordinatSemasaProvider)!)
      .then((value) async {
    ref.read(namaBandarProvider.notifier).update((_) => value);

    // proses dapatkan zon waktu solat
    final zonWaktuSolat = tentukanZon(
      namaBandar: ref.watch(namaBandarProvider),
      koordinatSemasa: ref.watch(koordinatSemasaProvider),
    );
    ref.read(zonWaktuSolatProvider.notifier).update((_) => zonWaktuSolat);

    // proses dapatkan jadual waktu solat
    await waktuSolatViaEsolatApi(
            zonWaktuSolat: ref.watch(zonWaktuSolatProvider)!)
        .then((value) =>
            ref.read(jadualWaktuSolatProvider.notifier).update((_) => value));
  });
});
