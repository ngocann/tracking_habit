import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserEntity {
  late String name;
  late String email;
  late String id;

  UserEntity(
    this.id,
    this.name,
    this.email,
  );

  UserEntity.fromUser(User currentUser) {
    UserEntity(
      currentUser.uid,
      currentUser.displayName ?? '',
      currentUser.email ?? '',
    );
  }
}
