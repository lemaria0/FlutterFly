class User {
  final String id;
  final String name;
  final String photo;
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.photo,
    required this.email,
  });

  User copyWith({
    String? id,
    String? name,
    String? photo,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      email: email ?? this.email,
    );
  }

  factory User.fromMap(Map<String, dynamic> map, String id) {
    return User(
      id: id,
      name: map['name'] ?? '',
      photo: map['photo'] ?? '',
      email: map['email'] ?? '',
    );
  }

  factory User.fromDocumentSnapshot(Map<String, dynamic> doc, String id) {
    return User(
      id: id,
      name: doc['name'] ?? '',
      photo: doc['photo'] ?? '',
      email: doc['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
      'email': email,
    };
  }
}