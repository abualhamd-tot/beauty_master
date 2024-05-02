part of 'services_bloc.dart';

sealed class ServicesState extends Equatable {
  const ServicesState();
  
  @override
  List<Object> get props => [];
}


final class ServicesLoading extends ServicesState {}

final class ServicesSuccess extends ServicesState {
  final List<ServiceEntity> Services;

  ServicesSuccess({required this.Services});
}

final class ServicesFailure extends ServicesState {
  final String msg;

  ServicesFailure({required this.msg});
}
