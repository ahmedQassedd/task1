import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:task1/modules/signin/signin_screen.dart';
import 'package:task1/shared/components.dart';
import 'package:task1/shared/cubit/app_cubit.dart';

PreferredSize appBar() => PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: AppBar(
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                ))),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgroundImage.png'),
                fit: BoxFit.fill)),
      ),
    ));

var emailController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();

class SignupComponent extends StatelessWidget {

  const SignupComponent({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome to fashion daily',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Register',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'Help',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.question_mark,
                              color: Colors.white,
                              size: 12,
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultTextFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Email!';
                          }
                          return null;
                        },
                        secure: false,
                        hintName: 'Eg. example@email.com'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                  Row(
                    children: [

                      CountryCodePicker(
                        initialSelection: 'EG',
                        favorite: ['+20','EG'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),

                      Expanded(
                        child: defaultTextFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Phone!';
                              }
                              return null;
                            },
                            secure: false,
                            hintName: 'Eg. 09124995886'),
                      ),
                    ],
                  )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'password',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    defaultTextFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Password!';
                          }
                          return null;
                        },
                        secure: AppCubit.get(context).secure,
                        suffix: AppCubit.get(context).suffixIcon,
                        suffixPressed: () {
                          AppCubit.get(context).changeSecureIcon();
                        },
                        hintName: 'Password'),
                    const SizedBox(
                      height: 12,
                    ),
                    customButton(
                        text: 'Register',
                        color: Colors.teal,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print('done');
                          }
                        }),


                  ],
                ),
              ],
            ),
          ),
            Column(
              children: [
               const SizedBox(
                  height: 3,
                ),
                Text(
                  'OR',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 3,
                ),

                customOutLineButton(text: 'Sign with by google',color: Colors.teal, onPressed: (){

                } ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Has any account?',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        navigateTo(context: context, widget: const SignInScreen());
                      },
                      child: Text(
                        'Sign in here',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),

                Text(
                  'By registering your account, you are agree to our',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black),),
                const SizedBox(
                  height: 6,
                ),
                  Text(
                    'Terms and condition',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.teal, fontWeight: FontWeight.bold),
                  ),



                  ],
            )
          ],
        ),
      ),
    );
  }
}
