import 'package:beauty_master/core/typedefs.dart';
import 'package:beauty_master/domain/entities/service.dart';

abstract class ServicesRepo {
  FutureEitherFailureOr<List<ServiceEntity>> getAll();
  FutureEitherFailureOr<ServiceEntity> getById({required String id});
  FutureEitherFailureOr<List<ServiceEntity>> searchByText({required String text});
}
