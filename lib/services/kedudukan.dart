import 'package:geolocator/geolocator.dart';
import 'package:waktu_solat/utils/class/koordinat.dart';

Future<Koordinat?> tentukanKedudukan() async {
  bool aksesDibenarkan;
  LocationPermission kebenaran;

  final Position kedudukan;

  aksesDibenarkan = await Geolocator.isLocationServiceEnabled();
  if (!aksesDibenarkan) {
    return Future.error('Perkhidmatan lokasi tidak dibenarkan');
  }

  kebenaran = await Geolocator.checkPermission();
  if (kebenaran == LocationPermission.denied) {
    kebenaran == await Geolocator.requestPermission();

    if (kebenaran == LocationPermission.denied) {
      return Future.error('Perminataan kebenaran lokasi enggan dibenarkan');
    }
  }

  if (kebenaran == LocationPermission.deniedForever) {
    return Future.error('Kebenaran lokasi enggan dibenarkan sampai bila-bila.');
  }

  kedudukan = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.best,
  );

  return Koordinat(
    latitud: kedudukan.latitude,
    longitud: kedudukan.longitude,
  );
}
