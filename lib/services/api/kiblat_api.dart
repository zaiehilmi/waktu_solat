import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waktu_solat/utils/class/koordinat.dart';

const arahKiblatEndpoint = 'https://api.aladhan.com/v1/qibla/';

String _urlPath(String path) => '$arahKiblatEndpoint$path';

Future<double> getArahKiblat(Koordinat koordinat) async {
  final url = Uri.parse(_urlPath('${koordinat.latitud}/${koordinat.longitud}'));

  double arahKiblat = 0;
  try {
    final response = await http.get(url);
    final json = await jsonDecode(response.body);

    arahKiblat = json['data']['direction'];
  } catch (e) {
    print(e);
  }
  print('arah kiblat api: $arahKiblat');
  return arahKiblat;
}
