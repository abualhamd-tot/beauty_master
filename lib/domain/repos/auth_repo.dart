import 'package:beauty_master/core/inputs/login_input.dart';
import 'package:beauty_master/domain/responses/login_response.dart';

import '../../core/typedefs.dart';

abstract class AuthRepo {
  FutureEitherFailureOr<LoginResponse> login({
    required LoginInputs inputs,
  });
  FutureEitherFailureOr<bool> register();
}
