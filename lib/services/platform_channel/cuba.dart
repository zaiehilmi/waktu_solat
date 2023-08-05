import 'package:flutter/services.dart';

const _namaSaluran = 'com.auzaie.waktu_solat/cuba';

const _saluran = MethodChannel(_namaSaluran);

Future<void> getString() async {
  String dariChannel;

  try {
    final String result = await _saluran.invokeMethod('getString');
    dariChannel = 'result dari channel $result';
  } on PlatformException catch (e) {
    dariChannel = 'tak dapat string';
  }

  print(dariChannel);
}
