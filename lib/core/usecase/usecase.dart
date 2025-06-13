import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/error/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, dynamic>> call(Params params);
}

class NoParams{}