import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:task1/modules/signup/signup_screen.dart';
import 'package:task1/shared/components.dart';

PreferredSize appBar() => PreferredSize(
    preferredSize: const Size.fromHeight(200),
    child: AppBar(
      leading: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),

      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgroundImage.png'),
                fit: BoxFit.fill)),
      ),
    ));

var phoneController = TextEditingController();
var formKey = GlobalKey<FormState>();

class SignInComponent extends StatelessWidget {
  const SignInComponent({Key? key}) : super(key: key);

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
                        'Sign in',
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

                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),

                customButton(
                    text: 'Sign in',
                    color: Colors.teal,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('done');
                      }
                    }),
                const SizedBox(
                  height: 10,
                ),

                Text(
                  'OR',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 10,
                ),

                customOutLineButton(text: 'Sign with by google',color: Colors.teal, onPressed: (){} ),


                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Doesn\'t has any account?',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        navigateTo(context: context, widget: const SignUpScreen());

                      },
                      child: Text(
                        'Register here',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Use the application according to policy rules, Any kinds of violations will be subject to sanctions',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.grey , fontWeight: FontWeight.bold),),
                ),


              ],
            )
          ],
        ),
      ),
    );
  }
}
