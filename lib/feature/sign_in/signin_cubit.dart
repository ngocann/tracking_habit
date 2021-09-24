import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_habit/core/base/base_bloc.dart';
import 'package:tracking_habit/core/data/api/i_auth_facade.dart';
import 'package:tracking_habit/core/entity/email.dart';
import 'package:tracking_habit/core/entity/password.dart';

import 'signin_state.dart';

@injectable
class SignInCubit extends BaseCubit<SignInState> {
  final IAuthFacade _authFacade;
  SignInCubit(
    this._authFacade,
  ) : super(const SignInState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> login() async {
    showLoading();
    final either = await _authFacade.signInWithEmailAndPassword(emailAddress: state.email.value,password: state.password.value);
    hideLoading();
    if(either.isLeft()) {
      showMessage("Khong the dang nhap");
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }else {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }

}
