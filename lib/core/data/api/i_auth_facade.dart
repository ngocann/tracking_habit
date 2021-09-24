import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:tracking_habit/core/entity/user_entity.dart';
import 'package:tracking_habit/core/error/failures.dart';

abstract class IAuthFacade {
  Future<UserEntity?> getSignedInUser();

  Future<Either<Failure, Unit>> registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });

  Future<Either<Failure, Unit>> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });

  Future<Either<Failure, Unit>> signInWithGoogle();

  Future<void> signOut();
}
