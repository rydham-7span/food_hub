class UserModel {
  const UserModel({
    this.name,
    this.email,
    this.password,
  });

  final String? name;
  final String? email;
  final String? password;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
      };

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }
}
