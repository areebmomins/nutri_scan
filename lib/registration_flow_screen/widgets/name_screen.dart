import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/registration_flow_bloc.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late var bloc = context.read<RegistrationFlowBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Enter your name'),
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF56428F),
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.all(16),
              child: IconButton(
                onPressed: () {
                  bloc.add(MoveForward());
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
