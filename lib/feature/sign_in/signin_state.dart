import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:tracking_habit/core/entity/email.dart';
import 'package:tracking_habit/core/entity/password.dart';

class SignInState extends Equatable {
  const SignInState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  final FormzStatus status;


  @override
  List<Object> get props => [email, password, status];

  SignInState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
