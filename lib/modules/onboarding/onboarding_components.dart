import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/modules/onboarding/onboarding_screen.dart';
import 'package:task1/modules/signup/signup_screen.dart';
import 'package:task1/shared/components.dart';


AppBar boardingAppBar(context) => AppBar(
  backgroundColor: Colors.white,
  elevation: 0.0,
  actions: [
    TextButton(
        onPressed: () {
          navigateAndFinish(context: context, widget: const SignUpScreen());
        },
        child:  Container(
          padding: const EdgeInsets.only(top: 10 , bottom: 10 , right: 20 , left: 20),
          decoration:  const BoxDecoration(
            color: Color(0xfffdf3d8),
            borderRadius: BorderRadiusDirectional.all(
                Radius.circular(20)
            ),
          ),
          child:  const Text(
            'Skip',
            style: TextStyle(color: Colors.black),
          ),
        ))
  ],
);


class BoardingComponents extends StatelessWidget {
  const BoardingComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context , index) => onBoardingItem(pages[index], context),
              itemCount: pages.length,
            ),
          ),
        ],)
    );
  }
}


class BoardingModel {
  String appName;
  String image;
  String subTitle;
  String description;

  BoardingModel(
      {required this.appName,
      required this.image,
      required this.subTitle,
      required this.description});
}

List<BoardingModel> pages = [
  BoardingModel(
      appName: '7Krava',
      image: 'assets/boarding1.png',
      subTitle: 'Get food delivery to your doorstep asap.',
      description:
          'we have young and professional delivery team that will bring your food as soon as possible to your doorstep fastly'),
  BoardingModel(
      appName: '7Krava',
      image: 'assets/boarding2.png',
      subTitle: 'Buy any food from your favorite restaurant.',
      description:
          'we are constantly adding your favourite restaurant throughout the territory and around your area carefully selected'),
  BoardingModel(
      appName: '7Krava',
      image: 'assets/boarding3.png',
      subTitle: 'We also have all kinds of dessert for you.',
      description:
          'we are constantly adding your favourite restaurant throughout the territory and around your area carefully selected'),
];







Widget onBoardingItem(BoardingModel model, context) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          model.appName,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.teal[200]),
        ),
        Image(
          image: AssetImage(model.image),
          height: 300,
          width: 300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                model.subTitle,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.description,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: pages.length,
                axisDirection: Axis.horizontal,
                effect: const SlideEffect(
                  spacing: 6.0,
                  radius: 0.2,
                  dotWidth: 20.0,
                  dotHeight: 5.0,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1.5,
                  dotColor: Color(0xffBBBBBB),
                  activeDotColor: Color(0xfffdf3d8),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              customButton(
                  text: 'Get Started',
                  color: Colors.teal,
                  onPressed: () {
                    navigateAndFinish(context: context, widget: const SignUpScreen());
                  }),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      navigateAndFinish(
                          context: context, widget: const SignUpScreen());
                    },
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
