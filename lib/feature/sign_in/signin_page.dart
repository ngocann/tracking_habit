import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tracking_habit/core/base/base_page.dart';

import 'signin_cubit.dart';
import 'signin_state.dart';

class SignInPage extends BaseStateless<SignInCubit> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<SignInCubit>();
    print('blocSignInCubit ${bloc.hashCode}');
    print('blocSignInCubit ${bloc.streamMessage.hashCode}');
    return super.build(context);
  }

  @override
  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40.0),
            const LiquidHeader(
              leftIcon: Icon(Icons.close),
              rightText: 'Create Account',
            ),
            const SizedBox(height: 30.0),
            const LiquidHeadline('Sign in to Liquid'),
            const SizedBox(height: 16.0),
            _EmailInput(),
            const SizedBox(height: 8.0),
            _PasswordInput(),
            const SizedBox(height: 8.0),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.read<SignInCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            helperText: '',
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<SignInCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            helperText: '',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return LiquidButton(
          text: 'Log in',
          onPress: state.status.isValidated
              ? () {
                  context.hideKeyBoard();
                  context.read<SignInCubit>().login();
                }
              : null,
        );
      },
    );
  }
}
