import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tracking_habit/core/error/failures.dart';

abstract class BaseCubit<T> extends Cubit<T> {
  final StreamController<String> _subjectMessage = PublishSubject();
  final StreamController<Failure> _subjectError = PublishSubject();
  final StreamController<bool> _subjectLoading = PublishSubject();

  BaseCubit(T initialState) : super(initialState);

  Stream<String> get streamMessage => _subjectMessage.stream;

  Stream<bool> get streamLoading => _subjectLoading.stream;

  Stream<Failure> get streamError => _subjectError.stream;

  void showMessage(String message) {
    _subjectMessage.add(message);
  }

  void handleError(Failure hcException) {
    _subjectError.add(hcException);
  }

  void showLoading() {
    _subjectLoading.add(true);
  }

  void hideLoading() {
    _subjectLoading.add(false);
  }


  @override
  Future<void> close() {
    _subjectLoading.close();
    _subjectMessage.close();
    _subjectError.close();
    return super.close();
  }
}
