import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:waktu_solat/utils/class/esolat.dart';
import 'package:waktu_solat/utils/constant/eSolat.dart';

const eSolatEndpoint =
    'https://www.e-solat.gov.my/index.php?r=esolatApi/takwimsolat&';

String _urlPath(String path) => '$eSolatEndpoint$path';

Future<ESolat> waktuSolatViaEsolatApi({
  TempohJadual tempohJadual = TempohJadual.week,
  required ZonWaktuSolat zonWaktuSolat,
}) async {
  ESolat eSolat = ESolat();

  final Uri url = Uri.parse(
      _urlPath('&period=${tempohJadual.name}&zone=${zonWaktuSolat.name}'));

  debugPrint('URL Esolat ==> $url');

  try {
    final response = await http.get(url);
    final json = await jsonDecode(response.body);

    eSolat = ESolat.fromJson(json["prayerTime"][0] ?? json["prayerTime"]);

    return eSolat;
  } catch (e) {
    debugPrint('ralat api esolat');
  }

  return eSolat;
}
