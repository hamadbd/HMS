class Rad {
  int? id;
  int? patientId;
  String? request;
  String? result;
  int? satus;

  Rad({this.id, this.patientId, this.request, this.result, this.satus});

  Rad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    request = json['request'];
    result = json['result'];
    satus = json['satus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['request'] = this.request;
    data['result'] = this.result;
    data['satus'] = this.satus;
    return data;
  }
}
