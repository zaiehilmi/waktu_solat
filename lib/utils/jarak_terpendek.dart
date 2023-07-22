import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waktu_solat/services/kedudukan.dart';
import 'package:waktu_solat/utils/class/koordinat.dart';
import 'package:waktu_solat/utils/constant/eSolat.dart';
import 'package:waktu_solat/utils/constant/zon_waktu_solat.dart';

part 'jarak_terpendek.g.dart';

@riverpod
ZonWaktuSolat cariZonTerdekat(
  CariZonTerdekatRef ref,
  // {required Koordinat koordinatSemasa}
) {
  final koord = ref.watch(tentukanKedudukanProvider);
  final koordinatSemasa = koord.whenData((value) => Koordinat(
        latitud: value!.latitud,
        longitud: value.longitud,
      )) as AsyncData<Koordinat>;

  double minDistance = double.infinity;
  // Set an initial nearest zone.
  ZonWaktuSolat nearestZone = ZonWaktuSolat.JHR01;

  for (var state in zonWaktuSolat.data.keys) {
    final zones = zonWaktuSolat.data[state]!.data;

    for (var zone in zones.keys) {
      for (var koordinatZon in zones[zone]!) {
        final distance = Geolocator.distanceBetween(
          koordinatSemasa.value.latitud,
          koordinatSemasa.value.longitud,
          koordinatZon.latitud,
          koordinatZon.longitud,
        );

        if (distance < minDistance) {
          minDistance = distance;
          nearestZone = zone;
        }
      }
    }
  }

  return nearestZone;
}
