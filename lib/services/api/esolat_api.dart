import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waktu_solat/utils/class/esolat.dart';
import 'package:waktu_solat/utils/constant/eSolat.dart';

part 'esolat_api.g.dart';

const eSolatEndpoint =
    'https://www.e-solat.gov.my/index.php?r=esolatApi/takwimsolat&';

String _urlPath(String path) => '$eSolatEndpoint$path';

@riverpod
Future<ESolat?> getWaktuSolatHariIni(
  GetWaktuSolatHariIniRef ref, {
  TempohJadual? tempohJadual,
  ZonWaktuSolat? zonWaktuSolat,
}) async {
  final url = Uri.parse(
      _urlPath('&period=${tempohJadual?.name}&zone=${zonWaktuSolat?.name}'));

  final ESolat eSolat;

  try {
    final response = await http.get(url);
    final json = await jsonDecode(response.body);

    eSolat = ESolat.fromJson(json["prayerTime"][0]);
    // ignore: unnecessary_null_comparison
    debugPrint('====> API ESolat boleh dibaca: ${eSolat.hari != null}');

    return eSolat;
  } catch (e) {
    print('lala: $e');
    return null;
  }
}
