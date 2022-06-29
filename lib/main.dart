import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/modules/onboarding/onboarding_screen.dart';
import 'package:task1/shared/components.dart';
import 'package:task1/shared/cubit/app_states.dart';
import 'package:task1/shared/cubit/bloc_observer/bloc_observer.dart';
import 'shared/cubit/app_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: lightingTheme(),
              debugShowCheckedModeBanner: false,
              home: OnBoardingScreen(),
            );
          }),
    );
  }
}
