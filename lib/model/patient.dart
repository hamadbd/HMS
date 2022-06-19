class Patient {
  int? iD;
  String? fullName;
  String? natId;
  String? birthDate;
  String? age;
  String? medicalRecord;
  String? evaluation;
  String? status;

  Patient(
      {this.iD,
        this.fullName,
        this.natId,
        this.birthDate,
        this.age,
        this.medicalRecord,
        this.evaluation,
        this.status});

  Patient.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    fullName = json['full_name'];
    natId = json['nat_id'];
    birthDate = json['birth_date'];
    age = json['age'];
    medicalRecord = json['medical_record'];
    evaluation = json['evaluation'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['full_name'] = this.fullName;
    data['nat_id'] = this.natId;
    data['birth_date'] = this.birthDate;
    data['age'] = this.age;
    data['medical_record'] = this.medicalRecord;
    data['evaluation'] = this.evaluation;
    data['status'] = this.status;
    return data;
  }
}
