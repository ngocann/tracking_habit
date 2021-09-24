import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_habit/core/extension/context_ext.dart';

import '../../routes.dart';
import 'splash_cubit.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<SplashCubit>().appStart();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).accentColor),
        child: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state == SplashState.UNAUTHORIZED) {
              context.pushAndRemove(AppRoutes.signIn);
            } else {
              context.pushAndRemove(AppRoutes.home);
            }
          },
          builder: (context, state) {
            return Container();
          },
        ),
      ),
    );
  }
}
