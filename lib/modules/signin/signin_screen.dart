
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/modules/signin/signin_components.dart';
import 'package:task1/shared/cubit/app_cubit.dart';
import 'package:task1/shared/cubit/app_states.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(),
        body: const  SignInComponent(),
      );

    });


  }
}



