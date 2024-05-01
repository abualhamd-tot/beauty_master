import 'package:beauty_master/core/inputs/login_input.dart';
import 'package:beauty_master/core/typedefs.dart';
import 'package:beauty_master/data/datasources/auth_datasource.dart';
import 'package:beauty_master/domain/repos/auth_repo.dart';
import 'package:beauty_master/domain/responses/login_response.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authDataSource;

  AuthRepoImpl({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;
  @override
  FutureEitherFailureOr<LoginResponse> login(
      {required LoginInputs inputs}) async {
    final result = await _authDataSource.login(inputs);

    return result.fold(
      (failure) => Left(failure),
      (json) => Right(LoginResponse.fromJson(json)),
    );
  }

  @override
  FutureEitherFailureOr<bool> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
