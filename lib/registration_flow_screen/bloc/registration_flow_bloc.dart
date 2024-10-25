import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/preference/shared_preference.dart';

part 'registration_flow_event.dart';

part 'registration_flow_state.dart';

class RegistrationFlowBloc
    extends Bloc<RegistrationFlowEvent, RegistrationFlowState> {
  RegistrationFlowScreens _currentScreen = RegistrationFlowScreens.nameScreen;
  String name = '';
  Genders gender = Genders.male;
  String age = '';
  Allergies allergy = Allergies.allergiesOne;

  RegistrationFlowBloc() : super(Initial()) {
    on<MoveForward>(_moveForward);
    on<MoveBackward>(_moveBackward);
    on<OnRegFinish>(_onRegFinish);
    on<OnGenderUpdated>(_onGenderUpdate);
    on<OnAllergyUpdated>(_onAllergyUpdate);
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

  void _onGenderUpdate(
    RegistrationFlowEvent event,
    Emitter<RegistrationFlowState> emit,
  ) async {
    emit(GenderUpdated(gender));
  }

  void _onAllergyUpdate(
    RegistrationFlowEvent event,
    Emitter<RegistrationFlowState> emit,
  ) async {
    emit(AllergyUpdated(allergy));
  }
}

enum RegistrationFlowScreens {
  nameScreen,
  genderScreen,
  ageScreen,
  allergiesScreen,
}

enum Genders {
  male,
  female,
}

enum Allergies {
  allergiesOne,
  allergiesTwo,
}
