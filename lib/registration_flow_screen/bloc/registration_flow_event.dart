part of 'registration_flow_bloc.dart';

sealed class RegistrationFlowEvent extends Equatable {
  const RegistrationFlowEvent();
}

final class MoveForward extends RegistrationFlowEvent {
  final RegistrationFlowScreens currentScreen;

  const MoveForward(this.currentScreen);

  @override
  List<Object> get props => [currentScreen];
}

final class MoveBackward extends RegistrationFlowEvent {
  @override
  List<Object> get props => [];
}

final class OnRegFinish extends RegistrationFlowEvent {
  @override
  List<Object> get props => [];
}

final class OnGenderUpdated extends RegistrationFlowEvent {
  @override
  List<Object> get props => [];
}

final class OnAllergyUpdated extends RegistrationFlowEvent {
  @override
  List<Object> get props => [];
}
