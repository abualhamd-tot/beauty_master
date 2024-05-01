import 'package:dartz/dartz.dart';

import 'network/error/failure.dart';

typedef FutureEitherFailureOr<T> = Future<Either<Failure, T>>;
