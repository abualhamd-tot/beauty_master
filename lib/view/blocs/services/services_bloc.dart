import 'package:beauty_master/domain/entities/service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repos/services_repo.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ServicesRepo _servicesRepo;
  ServicesBloc({required ServicesRepo servicesRepo})
      : _servicesRepo = servicesRepo,
        super(ServicesLoading()) {
    on<GetAllServicesEvent>((event, emit) async {
      emit(ServicesLoading());

      final result = await _servicesRepo.getAll();

      final resultingState = result.fold(
        (failure) => ServicesFailure(msg: failure.msg),
        (Services) => ServicesSuccess(Services: Services),
      );

      emit(resultingState);
    });
  }
}
