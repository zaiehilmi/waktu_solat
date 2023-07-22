// ignore_for_file: constant_identifier_names

import 'package:waktu_solat/utils/class/koordinat.dart';
import 'package:waktu_solat/utils/constant/eSolat.dart';

enum Negeri {
  Johor,
  Kedah,
  Kelantan,
  Melaka,
  NegeriSembilan,
  Pahang,
  Perlis,
  Penang,
  Perak,
  Sabah,
  Selangor,
  Sarawak,
  Terengganu,
  Wilayah,
}

class Zon {
  Map<ZonWaktuSolat, List<Koordinat>> data;

  Zon(this.data);
}

class NegeriDanWilayah {
  Map<Negeri, Zon> data;

  NegeriDanWilayah(this.data);
}

final zonWaktuSolat = NegeriDanWilayah({
  Negeri.Johor: Zon({
    ZonWaktuSolat.JHR01: [Koordinat(latitud: 2.58333, longitud: 104.31667)],
    ZonWaktuSolat.JHR02: [Koordinat(latitud: 1.71667, longitud: 103.53333)],
    ZonWaktuSolat.JHR03: [Koordinat(latitud: 1.65, longitud: 103.2)],
    ZonWaktuSolat.JHR04: [Koordinat(latitud: 2.26667, longitud: 102.53333)],
  }),
  Negeri.Kedah: Zon({
    ZonWaktuSolat.KDH01: [Koordinat(latitud: 6.25, longitud: 100.19167)],
    ZonWaktuSolat.KDH02: [Koordinat(latitud: 5.58333, longitud: 100.34167)],
    ZonWaktuSolat.KDH03: [Koordinat(latitud: 6.25833, longitud: 100.50833)],
    ZonWaktuSolat.KDH04: [Koordinat(latitud: 5.55, longitud: 100.60833)],
    ZonWaktuSolat.KDH05: [Koordinat(latitud: 5.13333, longitud: 100.49167)],
    ZonWaktuSolat.KDH06: [Koordinat(latitud: 6.45, longitud: 99.63333)],
    ZonWaktuSolat.KDH07: [Koordinat(latitud: 5.7875, longitud: 100.44167)],
  }),
  Negeri.Kelantan: Zon({
    ZonWaktuSolat.KTN01: [Koordinat(latitud: 6.5, longitud: 102.25)],
    ZonWaktuSolat.KTN03: [Koordinat(latitud: 4.95, longitud: 101.5)],
  }),
  Negeri.Melaka: Zon({
    ZonWaktuSolat.MLK01: [Koordinat(latitud: 2.38333, longitud: 102.18333)],
  }),
  Negeri.NegeriSembilan: Zon({
    ZonWaktuSolat.NGS01: [Koordinat(latitud: 2.58333, longitud: 102.18333)],
    ZonWaktuSolat.NGS02: [Koordinat(latitud: 2.73333, longitud: 102.25)],
  }),
  Negeri.Pahang: Zon({
    ZonWaktuSolat.PHG01: [Koordinat(latitud: 2.58333, longitud: 104.31667)],
    ZonWaktuSolat.PHG02: [Koordinat(latitud: 3.46667, longitud: 103.41667)],
    ZonWaktuSolat.PHG03: [Koordinat(latitud: 3.78333, longitud: 102.45)],
    ZonWaktuSolat.PHG04: [Koordinat(latitud: 3.9, longitud: 101.88333)],
    ZonWaktuSolat.PHG05: [Koordinat(latitud: 3.38333, longitud: 101.83333)],
    ZonWaktuSolat.PHG06: [Koordinat(latitud: 4.48333, longitud: 101.38333)],
  }),
  Negeri.Perlis: Zon({
    ZonWaktuSolat.PLS01: [Koordinat(latitud: 6.42194, longitud: 100.34167)],
  }),
  Negeri.Penang: Zon({
    ZonWaktuSolat.PNG01: [Koordinat(latitud: 5.41667, longitud: 100.2)],
  }),
  Negeri.Perak: Zon({
    ZonWaktuSolat.PRK01: [
      Koordinat(latitud: 3.783333, longitud: 101.625),
      Koordinat(latitud: 4.259722, longitud: 101.075),
    ],
    ZonWaktuSolat.PRK02: [
      Koordinat(latitud: 4.891667, longitud: 101.445833),
      Koordinat(latitud: 4.516667, longitud: 100.7125),
    ],
    ZonWaktuSolat.PRK03: [
      Koordinat(latitud: 5.008333, longitud: 101.445833),
      Koordinat(latitud: 5.458333, longitud: 100.870833),
    ],
    ZonWaktuSolat.PRK04: [
      Koordinat(latitud: 5.504167, longitud: 101.75),
      Koordinat(latitud: 5.570833, longitud: 101.209722),
    ],
    ZonWaktuSolat.PRK05: [
      Koordinat(latitud: 3.716667, longitud: 101.233333),
      Koordinat(latitud: 4.2, longitud: 100.533333),
    ],
    ZonWaktuSolat.PRK06: [
      Koordinat(latitud: 5.266667, longitud: 100.95),
      Koordinat(latitud: 5.075, longitud: 100.383333),
    ],
    ZonWaktuSolat.PRK07: [Koordinat(latitud: 4.866667, longitud: 100.8)],
  }),
  Negeri.Sabah: Zon({
    ZonWaktuSolat.SBH01: [Koordinat(latitud: 5.5, longitud: 117.8)],
    ZonWaktuSolat.SBH02: [Koordinat(latitud: 5.216667, longitud: 116.81667)],
    ZonWaktuSolat.SBH03: [Koordinat(latitud: 5.01667, longitud: 118.33333)],
    ZonWaktuSolat.SBH04: [Koordinat(latitud: 4.416667, longitud: 117.5)],
    ZonWaktuSolat.SBH05: [Koordinat(latitud: 6.88333, longitud: 116.83333)],
    ZonWaktuSolat.SBH06: [Koordinat(latitud: 6.08333, longitud: 116.533333)],
    ZonWaktuSolat.SBH07: [Koordinat(latitud: 5.733333, longitud: 115.933333)],
    ZonWaktuSolat.SBH08: [Koordinat(latitud: 5.333333, longitud: 116.166667)],
    ZonWaktuSolat.SBH09: [Koordinat(latitud: 5.083333, longitud: 115.55)],
  }),
  Negeri.Selangor: Zon({
    ZonWaktuSolat.SGR01: [
      Koordinat(latitud: 3.733333, longitud: 101.383333),
      Koordinat(latitud: 2.637778, longitud: 101.616667),
      Koordinat(latitud: 2.94, longitud: 101.911389),
    ],
    ZonWaktuSolat.SGR02: [
      Koordinat(latitud: 3.933333, longitud: 100.7),
      Koordinat(latitud: 3.2025, longitud: 101.488611),
    ],
    ZonWaktuSolat.SGR03: [
      Koordinat(latitud: 3.01667, longitud: 101.25),
      Koordinat(latitud: 2.802778, longitud: 101.655),
    ],
  }),
  Negeri.Sarawak: Zon({
    ZonWaktuSolat.SWK01: [Koordinat(latitud: 4.783333, longitud: 114.833333)],
    ZonWaktuSolat.SWK02: [Koordinat(latitud: 3.583333, longitud: 113.716667)],
    ZonWaktuSolat.SWK03: [Koordinat(latitud: 2.883333, longitud: 112.86667)],
    ZonWaktuSolat.SWK04: [Koordinat(latitud: 2.833333, longitud: 111.7)],
    ZonWaktuSolat.SWK05: [Koordinat(latitud: 2.233333, longitud: 111.21667)],
    ZonWaktuSolat.SWK06: [Koordinat(latitud: 1.783333, longitud: 111.116667)],
    ZonWaktuSolat.SWK07: [Koordinat(latitud: 1.46667, longitud: 110.48333)],
    ZonWaktuSolat.SWK08: [Koordinat(latitud: 1.816667, longitud: 109.766667)],
  }),
  Negeri.Terengganu: Zon({
    ZonWaktuSolat.TRG01: [Koordinat(latitud: 5.25, longitud: 102.966667)],
    ZonWaktuSolat.TRG02: [Koordinat(latitud: 5.416667, longitud: 102.416667)],
    ZonWaktuSolat.TRG03: [Koordinat(latitud: 5, longitud: 102.53333)],
    ZonWaktuSolat.TRG04: [Koordinat(latitud: 4.5, longitud: 102.866667)],
  }),
  Negeri.Wilayah: Zon({
    ZonWaktuSolat.WLY01: [Koordinat(latitud: 3.733333, longitud: 101.383333)],
    ZonWaktuSolat.WLY02: [Koordinat(latitud: 5.248056, longitud: 115.139722)],
  }),
});
