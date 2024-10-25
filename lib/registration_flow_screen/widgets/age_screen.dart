import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/registration_flow_bloc.dart';

class AgeScreen extends StatelessWidget {
  const AgeScreen({super.key});

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
            'What\s your age',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Color(0xFF432C81),
            ),
          ),
        ),
        Center(
          child: Container(
            width: 80,
            margin: const EdgeInsets.only(top: 12),
            child: TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
              textAlign: TextAlign.center,
              maxLength: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                hintText: '28',
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              onChanged: (age) {
                bloc.age = age;
              },
            ),
          ),
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
                  bloc.add(
                    const MoveForward(RegistrationFlowScreens.ageScreen),
                  );
                },
                icon: const Icon(
                  Icons.navigate_next,
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
