import 'dart:convert';
import 'User.model.dart';

class Role {
  final List<User> users;

  const Role({
    required this.users,
  });

  factory Role.fromJson(List<dynamic> json) => Role(
          users: json.fold<List<User>>([], (value, element) {
        value.add(User.fromJson(element));
        return value;
      }));
}
