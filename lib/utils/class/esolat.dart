import 'package:waktu_solat/utils/format_jam.dart';

class ESolat {
  String hari;
  String hijrah;
  String masihi;

  String subuh;
  String syuruk;
  String zohor;
  String asar;
  String maghrib;
  String isyak;

  ESolat({
    required this.hari,
    required this.hijrah,
    required this.masihi,
    required this.subuh,
    required this.syuruk,
    required this.zohor,
    required this.asar,
    required this.maghrib,
    required this.isyak,
  });

  factory ESolat.fromJson(Map<String, dynamic> data) {
    final hari = data['day'] as String;
    final hijrah = data['hijri'] as String;
    final masihi = data['date'] as String;

    final subuh = formatMasa(data['fajr']);
    final syuruk = formatMasa(data['syuruk']);
    final zohor = formatMasa(data['dhuhr']);
    final asar = formatMasa(data['asr']);
    final maghrib = formatMasa(data['maghrib']);
    final isyak = formatMasa(data['isha']);

    return ESolat(
      hari: hari,
      hijrah: hijrah,
      masihi: masihi,
      subuh: subuh,
      syuruk: syuruk,
      zohor: zohor,
      asar: asar,
      maghrib: maghrib,
      isyak: isyak,
    );
  }
}
