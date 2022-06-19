class Bill {
  int? id;
  int? patientId;
  String? totalBill;
  int? isApproved;

  Bill({this.id, this.patientId, this.totalBill, this.isApproved});

  Bill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    totalBill = json['total_bill'];
    isApproved = json['is_approved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['total_bill'] = this.totalBill;
    data['is_approved'] = this.isApproved;
    return data;
  }
}
