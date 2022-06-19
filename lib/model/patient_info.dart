class PatientInfo {
  int? id;
  int? patientId;
  String? symptoms;
  String? diagnosis;
  int? isLab;
  String? labName;
  int? isRad;
  String? radName;
  int? isSpe;
  String? speName;

  PatientInfo(
      {this.id,
        this.patientId,
        this.symptoms,
        this.diagnosis,
        this.isLab,
        this.labName,
        this.isRad,
        this.radName,
        this.isSpe,
        this.speName});

  PatientInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    symptoms = json['symptoms'];
    diagnosis = json['diagnosis'];
    isLab = json['is_lab'];
    labName = json['lab_name'];
    isRad = json['is_rad'];
    radName = json['rad_name'];
    isSpe = json['is_spe'];
    speName = json['spe_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['symptoms'] = this.symptoms;
    data['diagnosis'] = this.diagnosis;
    data['is_lab'] = this.isLab;
    data['lab_name'] = this.labName;
    data['is_rad'] = this.isRad;
    data['rad_name'] = this.radName;
    data['is_spe'] = this.isSpe;
    data['spe_name'] = this.speName;
    return data;
  }
}
