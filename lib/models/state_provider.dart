import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waktu_solat/utils/class/esolat.dart';
import 'package:waktu_solat/utils/class/koordinat.dart';
import 'package:waktu_solat/utils/constant/eSolat.dart';

final koordinatSemasaProvider = StateProvider<Koordinat?>((ref) => null);

final namaBandarProvider = StateProvider<String?>((ref) => null);

final zonWaktuSolatProvider = StateProvider<ZonWaktuSolat?>((ref) => null);

final jadualWaktuSolatProvider = StateProvider<ESolat?>((ref) => null);
