import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/registration_flow_bloc.dart';

class AgeScreen extends StatelessWidget {
  const AgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late var bloc = context.read<RegistrationFlowBloc>();

    return Container(
      child: Column(
        children: [
          Text('Age'),
          IconButton(
            onPressed: () {
              bloc.add(MoveBackward());
            },
            icon: Icon(Icons.navigate_before),
          ),
          IconButton(
            onPressed: () {
              bloc.add(MoveForward());
            },
            icon: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
