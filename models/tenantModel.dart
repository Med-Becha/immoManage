class Tenant {
  int? id;
  String name;
  String email;
  String phone;
  String cin;
  String address;
  String job;
  String budget;
  String? remark;
  // userId field removed since it's not in the JSON response

  Tenant({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.cin,
    required this.address,
    required this.job,
    required this.budget,
    this.remark,
    // userId removed from constructor
  });

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      cin: json['cin'],
      address: json['address'],
      job: json['job'],
      budget: json['budget'],
      remark: json['remark'],
      // userId removed from parsing
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'cin': cin,
      'address': address,
      'job': job,
      'budget': budget,
      'remark': remark,
      // userId removed from serialization
    };
  }
}
