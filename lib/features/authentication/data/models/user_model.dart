
import 'package:mobile/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.email, required super.role, required super.firstName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      email: json['email'],
      role: json['role'],
      firstName: json['firstName'],
    );
  }
}
