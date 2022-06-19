class Medication {
  int? id;
  int? patientId;
  String? prescribed;
  int? satus;

  Medication({this.id, this.patientId, this.prescribed, this.satus});

  Medication.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    prescribed = json['prescribed'];
    satus = json['satus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['prescribed'] = this.prescribed;
    data['satus'] = this.satus;
    return data;
  }
}
