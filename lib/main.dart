import 'package:flutter/material.dart';
import 'package:nutri_scan/registration_flow_screen/registration_flow_screen.dart';

import 'data/preference/shared_preference.dart';
import 'home_screen/text_detector_view.dart';

Future<void> main() async {
  SharedPreference.instance.initPreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriScan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          surface: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: SharedPreference.instance.isRegDone(),
        builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.data == true) {
            return TextRecognizerView();
          } else {
            return const RegistrationFlowScreen();
          }
        },
      ),
    );
  }
}
