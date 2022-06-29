import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/shared/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);

bool secure = true ;
IconData suffixIcon = Icons.visibility_off_outlined;

void changeSecureIcon() {
    secure = !secure;
    suffixIcon =
    secure ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ChangeSecure());
  }



}