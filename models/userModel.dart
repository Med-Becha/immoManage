class User {
  int id;
  String name;
  String email;
  String? phone;
  bool admin;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.admin = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'admin': admin,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      admin: json['admin'],
    );
  }
}
