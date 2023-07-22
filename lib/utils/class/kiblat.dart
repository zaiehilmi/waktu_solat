class IKiblatApiResponse {
  int status;
  Data data;

  IKiblatApiResponse({required this.status, required this.data});

  factory IKiblatApiResponse.fromJson(Map<String, dynamic> json) {
    return IKiblatApiResponse(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  int code;
  String status;
  KiblatData data;

  Data({required this.code, required this.status, required this.data});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      code: json['code'],
      status: json['status'],
      data: KiblatData.fromJson(json['data']),
    );
  }
}

class KiblatData {
  double latitude;
  double longitude;
  double direction;

  KiblatData(
      {required this.latitude,
      required this.longitude,
      required this.direction});

  factory KiblatData.fromJson(Map<String, dynamic> json) {
    return KiblatData(
      latitude: json['latitude'],
      longitude: json['longitude'],
      direction: json['direction'],
    );
  }
}
