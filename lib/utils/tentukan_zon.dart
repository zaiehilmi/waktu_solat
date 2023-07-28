import 'package:waktu_solat/utils/constant/eSolat.dart';
import 'package:waktu_solat/utils/zon_terdekat.dart';

ZonWaktuSolat tentukanZon({
  String? namaBandar = 'lain-lain',
  required koordinatSemasa,
}) {
  ZonWaktuSolat zon = ZonWaktuSolat.TIDAK_DIKETAHUI;

  switch (namaBandar) {
    case 'Kuala Lumpur':
    case 'Putrajaya':
      zon = ZonWaktuSolat.WLY01;
      break;
    case 'Labuan':
      zon = ZonWaktuSolat.WLY02;
      break;
    case 'Melaka':
      zon = ZonWaktuSolat.MLK01;
      break;
    case 'Perlis':
      zon = ZonWaktuSolat.PLS01;
      break;
    case 'Pulau Pinang':
      zon = ZonWaktuSolat.PNG01;
      break;
    default:
      zon = cariZonTerdekat(koordinatSemasa);
      break;
  }
  return zon;
}
