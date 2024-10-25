part of 'registration_flow_bloc.dart';

sealed class RegistrationFlowEvent extends Equatable {
  const RegistrationFlowEvent();
}

final class MoveForward extends RegistrationFlowEvent {
  @override
  List<Object> get props => [];
}

final class MoveBackward extends RegistrationFlowEvent {
  @override
  List<Object> get props => [];
}

final class OnRegFinish extends RegistrationFlowEvent {
  @override
  List<Object> get props => [];
}
