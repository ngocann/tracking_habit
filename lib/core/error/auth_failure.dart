import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tracking_habit/core/error/failures.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure extends Failure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}
