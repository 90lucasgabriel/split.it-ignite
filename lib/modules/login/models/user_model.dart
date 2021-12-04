import 'package:google_sign_in/google_sign_in.dart';

class UserModel {
  final String id;
  final String email;
  final String? name;
  final String? photoUrl;

  UserModel({
    required this.id,
    required this.email,
    this.name,
    this.photoUrl,
  });

  factory UserModel.google(GoogleSignInAccount google) {
    return UserModel(
        id: google.id,
        email: google.email,
        name: google.displayName,
        photoUrl: google.photoUrl);
  }
}
