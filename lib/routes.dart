import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_habit/core/di/injection.dart';

import 'feature/splash/splash_cubit.dart';
import 'feature/splash/splash_page.dart';

class AppRoutes {
  static final splash = "/";
  static final home = "/home";
  static final signIn = "/signIn";
  static final signIn2FA = "/signIn2Fa";
  static final signUp = "/signUp";
}

Map<String, WidgetBuilder> routes() {
  return {
    AppRoutes.splash: (context) {
      return BlocProvider<SplashCubit>(
        create: (context) => getIt<SplashCubit>(),
        child: SplashPage(),
      );
    },
  };
}
