import 'package:equatable/equatable.dart';

class LoginInputs extends Equatable {
  final String email;
  final String password;

  LoginInputs({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
