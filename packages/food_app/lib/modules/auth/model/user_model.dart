class UserModel {
  UserModel({
    this.name,
    this.email,
    this.password,
    this.restaurantId,
    this.isAdmin,
  });

  final String? name;
  final String? email;
  final String? password;
  final String? restaurantId;
  bool? isAdmin = false;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      if ((password?.isNotEmpty ?? false) || (password != '')) 'password': password,
      'restaurantId': restaurantId,
      'isAdmin': isAdmin,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? restaurantId,
    bool? isAdmin,
  }) {
    return UserModel(
      isAdmin: isAdmin ?? this.isAdmin,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      restaurantId: restaurantId ?? this.restaurantId,
    );
  }
}
