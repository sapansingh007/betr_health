class UserModel {
  final int? id;
  final String name;
  final String email;
  final String passwordHash;

    UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.passwordHash,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': passwordHash,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      passwordHash: map['password'],
    );
  }
}
