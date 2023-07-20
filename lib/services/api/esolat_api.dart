import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:waktu_solat/utils/constant/eSolat.dart';
import 'package:waktu_solat/utils/interface/koordinat.dart';

const eSolatEndpoint =
    'https://www.e-solat.gov.my/index.php?r=esolatApi/takwimsolat&';

String _urlPath(String path) => '$eSolatEndpoint$path';

Future<void> getWaktuSolatHariIni({
  TempohJadual? tempohJadual,
  ZonWaktuSolat? zonWaktuSolat,
}) async {
  final url = Uri.parse(
      _urlPath('&period=${tempohJadual?.name}&zone=${zonWaktuSolat?.name}'));

  try {
    final response = await http.get(url);

    debugPrint(response.body);
  } catch (e) {
    print(e);
  }
}
