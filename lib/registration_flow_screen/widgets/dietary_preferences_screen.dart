import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_scan/utils/utils.dart';

import '../bloc/registration_flow_bloc.dart';

class DietaryPreferencesScreen extends StatelessWidget {
  const DietaryPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late var bloc = context.read<RegistrationFlowBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 24),
          child: Text(
            'Dietary Preferences?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Color(0xFF432C81),
            ),
          ),
        ),
        BlocBuilder<RegistrationFlowBloc, RegistrationFlowState>(
          buildWhen: (previousState, state) {
            return state is DietaryPreferencesUpdated;
          },
          builder: (context, state) {
            return Center(
              child: Wrap(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFA095C1),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<DietaryPreferences>(
                      value: bloc.dietaryPreferences,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFFA095C1),
                      ),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(height: 0),
                      onChanged: (DietaryPreferences? value) {
                        bloc.dietaryPreferences =
                            value ?? DietaryPreferences.ovoVegetarian;
                        bloc.add(OnDietaryPreferencesUpdated());
                      },
                      items: DietaryPreferences.values
                          .map<DropdownMenuItem<DietaryPreferences>>(
                        (DietaryPreferences value) {
                          return DropdownMenuItem<DietaryPreferences>(
                            value: value,
                            child: Text(value.title),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const Spacer(),
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.all(8),
              child: IconButton(
                onPressed: () {
                  bloc.add(MoveBackward());
                },
                icon: const Icon(
                  Icons.navigate_before,
                  size: 32,
                  color: Color(0xFF56428F),
                ),
                padding: const EdgeInsets.all(12),
              ),
            ),
            const Spacer(),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF56428F),
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.all(16),
              child: IconButton(
                onPressed: () {
                  bloc.add(OnRegFinish());
                },
                icon: const Icon(
                  Icons.done,
                  size: 32,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
