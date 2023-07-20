import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:waktu_solat/utils/interface/koordinat.dart';

const arahKiblatEndpoint = 'https://api.aladhan.com/v1/qibla/';

String _urlPath(String path) => '$arahKiblatEndpoint$path';

Future<void> getArahKiblat(Koordinat koordinat) async {
  final url = Uri.parse(_urlPath('${koordinat.latitud}/${koordinat.longitud}'));

  try {
    final response = await http.get(url);

    debugPrint(response.body);
  } catch (e) {
    print(e);
  }
}
