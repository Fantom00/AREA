class User {
  final String userId;
  final String email;
  final String picture;
  final String name;

  const User({
    required this.userId,
    required this.email,
    required this.picture,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['user_id'],
        email: json['email'],
        picture: json['picture'],
        name: json['name'],
      );
}
