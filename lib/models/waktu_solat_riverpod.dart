import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waktu_solat/models/state_provider.dart';
import 'package:waktu_solat/services/api/esolat_api.dart';
import 'package:waktu_solat/services/api/nominatim_api.dart';
import 'package:waktu_solat/services/kedudukan.dart';
import 'package:waktu_solat/utils/class/koordinat.dart';
import 'package:waktu_solat/utils/tentukan_zon.dart';

final kedudukanProvider = FutureProvider<void>((ref) async {
  final koord = await tentukanKedudukan();

  // proses dapatkan koordinat semasa peranti
  ref.read(koordinatSemasaProvider.notifier).update((_) => Koordinat(
        latitud: koord!.latitud,
        longitud: koord.longitud,
      ));
});

final waktuSolatProvider = FutureProvider<void>((ref) async {
  // proses dapatkan nama bandar
  String? namaBandar;
  await namaBandarViaNominatimApi(ref.watch(koordinatSemasaProvider)!)
      .then((value) => namaBandar = value);
  ref.read(namaBandarProvider.notifier).update((_) => namaBandar);

  // proses dapatkan zon waktu solat
  final zonWaktuSolat = tentukanZon(
    namaBandar: ref.watch(namaBandarProvider),
    koordinatSemasa: ref.watch(koordinatSemasaProvider),
  );
  ref.read(zonWaktuSolatProvider.notifier).update((_) => zonWaktuSolat);

  // proses dapatkan jadual waktu solat
  await waktuSolatViaEsolatApi(zonWaktuSolat: ref.watch(zonWaktuSolatProvider)!)
      .then((value) =>
          ref.read(jadualWaktuSolatProvider.notifier).update((_) => value));
});
