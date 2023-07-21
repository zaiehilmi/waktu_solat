import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:waktu_solat/utils/class/koordinat.dart';

const nominatimEndpoint = 'https://nominatim.openstreetmap.org/reverse.php';

String _urlPath(String path) => '$nominatimEndpoint$path';

Future<void> getNamaBandar(Koordinat koordinat) async {
  final url = Uri.parse(_urlPath(
      '?lat=${koordinat.latitud.toString()}&lon=${koordinat.longitud.toString()}&format=jsonv2'));
  // '?lat=3.11226&lon=101.71629&format=jsonv2'));
  print(url);
  try {
    final response = await http.get(url);

    debugPrint(response.body);
    debugPrint(response.headers.toString());
  } catch (e) {
    print(e);
  }
}
