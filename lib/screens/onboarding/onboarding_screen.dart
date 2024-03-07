import 'package:aeroplanner_app/router/router.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:aeroplanner_app/widgets/action_button_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(flex: 3),
                Text(
                  'Discover the convenience of flight planning.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white40,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(flex: 2),
                Column(
                  children: [
                    ActionButtonWidget(
                      text: 'Get started',
                      width: 350,
                      onTap: () {
                        context.router.push(HomeRoute());
                      },
                    ),
                    SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Terms of Use',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.white14,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '/',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white14,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Privacy Policy',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.white14,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
