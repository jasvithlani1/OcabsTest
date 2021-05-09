class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String token;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        token = json['token'];

  Map<String, String> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'token': token,
      };

  @override
  String toString() {
    return '$name < $id, $email, $phone, $token >';
  }
}
