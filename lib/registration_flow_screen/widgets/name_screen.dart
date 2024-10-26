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
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 24),
          child: Text(
            'What\'s your name?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Color(0xFF432C81),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
          child: TextField(
            keyboardType: TextInputType.name,
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              hintText: 'Rohit, Nikhil etc.',
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            onChanged: (name) {
              bloc.name = name;
            },
          ),
        ),
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
                  bloc.add(
                    const MoveForward(RegistrationFlowScreens.nameScreen),
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
