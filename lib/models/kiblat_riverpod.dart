import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waktu_solat/models/state_provider.dart';
import 'package:waktu_solat/services/api/kiblat_api.dart';
import 'package:waktu_solat/services/kedudukan.dart';
import 'package:waktu_solat/utils/class/koordinat.dart';

final getKiblatProvider = FutureProvider<void>((ref) async {
  // proses dapatkan koordinat semasa peranti
  await tentukanKedudukan().then((value) {
    debugPrint('==> ${value!.longitud}');
    ref.read(koordinatSemasaProvider.notifier).update((_) => Koordinat(
          latitud: value.latitud,
          longitud: value.longitud,
        ));
  });

  await getArahKiblat(ref.watch(koordinatSemasaProvider)!)
      .then((value) => ref.read(kiblatProvider.notifier).update((_) => value));
});
