import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_habit/core/error/failures.dart';
import 'package:tracking_habit/core/usecase/usecase.dart';

class AddHabitUseCase extends UseCase<bool, Params> {


  @override
  Future<Either<Failure, bool>> call(Params params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class Params extends Equatable {
  final int number;

  Params({required this.number});

  @override
  List<Object> get props => [number];
}
