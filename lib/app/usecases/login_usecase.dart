import 'package:beauty_master/core/base/usecase.dart';
import 'package:beauty_master/core/external_dependencies/shared_prefs.dart';
import 'package:beauty_master/core/inputs/login_input.dart';
import 'package:beauty_master/core/network/error/failure.dart';
import 'package:beauty_master/core/typedefs.dart';
import 'package:beauty_master/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../core/local_keys.dart';

class LoginUsecase
    extends BaseUsecase<FutureEitherFailureOr<bool>, LoginInputs> {
  final AuthRepo _authRepo;
  final SharedPrefs _sharedPrefs;

  LoginUsecase({
    required AuthRepo authRepo,
    required SharedPrefs sharedPrefs,
  })  : _sharedPrefs = sharedPrefs,
        _authRepo = authRepo;

  @override
  FutureEitherFailureOr<bool> call(LoginInputs inputs) async {
    final result = await _authRepo.login(inputs: inputs);

    return result.fold(
      (failure) => Left(failure),
      (loginResponse) async {
        try {
          final didCachePassword = await _sharedPrefs.saveString(
              key: LocalKeys.accessToken, value: loginResponse.accessToken);
          if (didCachePassword ?? false) {
            return Right(true);
          }

          return Right(false);
        } catch (e) {
          return Left(CacheFailure(msg: e.toString()));
        }
      },
    );
  }
}
