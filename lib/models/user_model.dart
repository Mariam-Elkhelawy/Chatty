class UserModel {
  static const String collectionName = 'Users';
  String id;
  String name;
  String email;
  String phone;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone});
  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          email: json['email'],
          phone: json['phone'],
        );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
