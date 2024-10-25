part of 'registration_flow_bloc.dart';

sealed class RegistrationFlowState extends Equatable {
  const RegistrationFlowState();
}

final class Initial extends RegistrationFlowState {
  @override
  List<Object> get props => [];
}

final class UpdateScreen extends RegistrationFlowState {
  final RegistrationFlowScreens screen;

  const UpdateScreen(this.screen);

  @override
  List<Object> get props => [screen];
}

final class RegFinish extends RegistrationFlowState {
  @override
  List<Object> get props => [];
}