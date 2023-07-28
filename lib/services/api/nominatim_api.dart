import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:waktu_solat/utils/class/koordinat.dart';
import 'package:waktu_solat/utils/class/nominatim.dart';

const nominatimEndpoint = 'https://nominatim.openstreetmap.org/reverse.php';

String _urlPath(String path) => '$nominatimEndpoint$path';

Future<String?> namaBandarViaNominatimApi(Koordinat koordinatSemasa) async {
  final Alamat nominatim;

  final url = Uri.parse(_urlPath(
      '?lat=${koordinatSemasa.latitud.toString()}&lon=${koordinatSemasa.longitud.toString()}&format=jsonv2'));

  debugPrint('URL Nominatim ==> $url');

  try {
    final response = await http.get(url);
    final json = await jsonDecode(response.body);

    nominatim = Alamat.fromJson(json);
    debugPrint('===> negeri: ${nominatim.negeri ?? nominatim.bandar}');

    if (nominatim.negeri != null) {
      return nominatim.negeri;
    } else if (nominatim.bandar != null) {
      return nominatim.bandar;
    } else {
      return null;
    }
  } catch (e) {
    debugPrint('ralat nominatim API');

    return null;
  }
}
