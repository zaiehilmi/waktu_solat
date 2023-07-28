class Alamat {
  String? negara;
  String? kodNegara;
  String? daerah;
  String? poskod;
  String? rantau;
  String? negeri;
  String? bandar;

  Alamat({
    this.negara,
    this.kodNegara,
    this.daerah,
    this.poskod,
    this.rantau,
    this.negeri,
    this.bandar,
  });

  factory Alamat.fromJson(Map<String, dynamic> data) {
    final alamat = data['address'];

    final negara = alamat['country'] as String?;
    final kodNegara = alamat['countryCode'] as String?;
    final daerah = alamat['district'] as String?;
    final rantau = alamat['region'] as String?;
    final negeri = alamat['state'] as String?;
    final bandar = alamat['city'] as String?;

    return Alamat(
      negara: negara,
      kodNegara: kodNegara,
      daerah: daerah,
      rantau: rantau,
      negeri: negeri,
      bandar: bandar,
    );
  }
}
