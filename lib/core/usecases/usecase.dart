import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_app/core/errors/failures.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call();
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
