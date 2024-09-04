class UserEntity {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  // Método para converter um mapa em um objeto UserEntity
  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      email: map['email'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      avatar: map['avatar'],
    );
  }

  // Método para converter um objeto UserEntity em um mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }
}