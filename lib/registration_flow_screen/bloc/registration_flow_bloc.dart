import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/preference/shared_preference.dart';

part 'registration_flow_event.dart';

part 'registration_flow_state.dart';

class RegistrationFlowBloc
    extends Bloc<RegistrationFlowEvent, RegistrationFlowState> {
  RegistrationFlowScreens _currentScreen = RegistrationFlowScreens.nameScreen;
  String name = '';

  RegistrationFlowBloc() : super(Initial()) {
    on<MoveForward>(_moveForward);
    on<MoveBackward>(_moveBackward);
    on<OnRegFinish>(_onRegFinish);
  }

  void _moveForward(
    RegistrationFlowEvent event,
    Emitter<RegistrationFlowState> emit,
  ) async {
    var nextIndex = _currentScreen.index + 1;
    _currentScreen = RegistrationFlowScreens.values[nextIndex];
    emit(UpdateScreen(_currentScreen));
  }

  void _moveBackward(
    RegistrationFlowEvent event,
    Emitter<RegistrationFlowState> emit,
  ) async {
    var previousIndex = _currentScreen.index - 1;
    _currentScreen = RegistrationFlowScreens.values[previousIndex];
    emit(UpdateScreen(_currentScreen));
  }

  void _onRegFinish(
    RegistrationFlowEvent event,
    Emitter<RegistrationFlowState> emit,
  ) async {
    await SharedPreference.instance.updateIsRegDone(true);
    emit(RegFinish());
  }
}

enum RegistrationFlowScreens {
  nameScreen,
  ageScreen,
  genderScreen,
  allergiesScreen,
}
