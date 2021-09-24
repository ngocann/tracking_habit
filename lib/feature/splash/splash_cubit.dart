import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_habit/core/data/api/i_auth_facade.dart';
import 'package:tracking_habit/core/entity/user_entity.dart';

enum SplashState {
  LOADING,AUTHORIZED,UNAUTHORIZED
}

@injectable
class SplashCubit extends Cubit<SplashState> {
  final IAuthFacade _authFacade;

  SplashCubit(this._authFacade) : super(SplashState.LOADING);

  Future<void> appStart() async {
    final UserEntity? isSignedIn = await _authFacade.getSignedInUser();
    if(isSignedIn != null) {
      emit(SplashState.AUTHORIZED);
    }else {
      emit(SplashState.UNAUTHORIZED);
    }
  }
}
