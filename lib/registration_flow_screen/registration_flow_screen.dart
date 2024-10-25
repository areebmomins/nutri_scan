import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_scan/registration_flow_screen/widgets/age_screen.dart';
import 'package:nutri_scan/registration_flow_screen/widgets/allergies_screen.dart';
import 'package:nutri_scan/registration_flow_screen/widgets/gender_screen.dart';
import 'package:nutri_scan/registration_flow_screen/widgets/name_screen.dart';

import '../home_screen/text_detector_view.dart';
import 'bloc/registration_flow_bloc.dart';

class RegistrationFlowScreen extends StatelessWidget {
  const RegistrationFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationFlowBloc(),
      child: BlocListener<RegistrationFlowBloc, RegistrationFlowState>(
        listener: (context, state) {
          if (state is RegFinish) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => TextRecognizerView(),
              ),
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<RegistrationFlowBloc, RegistrationFlowState>(
              buildWhen: (previousState, state) {
                return state is UpdateScreen;
              },
              builder: (context, state) {
                if (state is UpdateScreen) {
                  if (state.screen == RegistrationFlowScreens.nameScreen) {
                    return const NameScreen();
                  } else if (state.screen ==
                      RegistrationFlowScreens.ageScreen) {
                    return const AgeScreen();
                  } else if (state.screen ==
                      RegistrationFlowScreens.genderScreen) {
                    return const GenderScreen();
                  } else if (state.screen ==
                      RegistrationFlowScreens.allergiesScreen) {
                    return const AllergiesScreen();
                  } else {
                    return const NameScreen();
                  }
                } else {
                  return const NameScreen();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
