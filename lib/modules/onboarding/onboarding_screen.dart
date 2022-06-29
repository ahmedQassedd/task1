import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/modules/onboarding/onboarding_components.dart';
import 'package:task1/shared/cubit/app_cubit.dart';
import 'package:task1/shared/cubit/app_states.dart';


var pageController = PageController();

class OnBoardingScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      AppCubit cubit = AppCubit.get(context);

      return Scaffold(
          backgroundColor: Colors.white,
          appBar: boardingAppBar(context) ,
          body: const BoardingComponents());
    });


  }
}



