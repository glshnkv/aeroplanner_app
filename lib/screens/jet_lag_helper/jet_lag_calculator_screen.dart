import 'package:aeroplanner_app/router/router.dart';
import 'package:aeroplanner_app/screens/jet_lag_helper/jet_lag_bloc/jet_lag_bloc.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:aeroplanner_app/widgets/action_button_widget.dart';
import 'package:aeroplanner_app/widgets/app_container.dart';
import 'package:aeroplanner_app/widgets/textfield_app_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class JetLagCalculatorScreen extends StatefulWidget {
  const JetLagCalculatorScreen({super.key});

  @override
  State<JetLagCalculatorScreen> createState() => _JetLagCalculatorScreenState();
}

class _JetLagCalculatorScreenState extends State<JetLagCalculatorScreen> {
  final pageController = PageController();

  final countryArrivalController = TextEditingController();
  final countryDepartureController = TextEditingController();
  final timeController = TextEditingController();

  DateTime _time = DateTime.now();

  @override
  void dispose() {
    pageController.dispose();
    countryArrivalController.dispose();
    countryDepartureController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          centerTitle: true,
          leadingWidth: 125,
          backgroundColor: AppColors.white8,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                context.router.push(HomeRoute());
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: AppColors.yellow),
                  Text(
                    'Your flight',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          title: Text(
            'Jet lag helper',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SizedBox(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFieldAppWidget(
                        controller: countryArrivalController,
                        hintText: 'Country of arrival'),
                    SizedBox(height: 10),
                    TextFieldAppWidget(
                        controller: countryDepartureController,
                        hintText: 'Country of departure'),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'When do you normally go to sleep?',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      readOnly: true,
                      onTap: () {
                        _showDialog(
                          CupertinoDatePicker(
                            initialDateTime: _time,
                            mode: CupertinoDatePickerMode.time,
                            use24hFormat: true,
                            onDateTimeChanged: (DateTime newTime) {
                              setState(() {
                                timeController.text =
                                    '${newTime.hour}:${newTime.minute}';
                                _time = newTime;
                              });
                            },
                          ),
                        );
                      },
                      style: TextStyle(color: Colors.white),
                      controller: timeController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white8,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.white14, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white14),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'Time',
                        hintStyle: TextStyle(
                          color: AppColors.white14,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ActionButtonWidget(
                        text: 'Next',
                        width: double.infinity,
                        onTap: () {
                          if (countryArrivalController.text.isNotEmpty &&
                              countryDepartureController.text.isNotEmpty &&
                              timeController.text.isNotEmpty) {
                            context.read<JetLagBloc>().add(CalculateTimeEvent(
                                countryArrival: countryArrivalController.text,
                                countryDeparture:
                                    countryDepartureController.text,
                                sleepTime: _time));
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.yellow,
                                content: Text(
                                  'Please, Fill out the remaining fields',
                                  style: TextStyle(color: AppColors.black),
                                ),
                              ),
                            );
                          }
                        }),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: BlocProvider(
                  create: (context) => JetLagBloc()..add(GetTimeEvent()),
                  child: BlocConsumer<JetLagBloc, JetLagState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is LoadedTimeState) {
                        return Column(
                          children: [
                            AppContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'To have to go to bed at:',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            color: AppColors.yellow14,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0))),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/elements/clock.svg'),
                                            SizedBox(width: 5),
                                            Text(
                                              state.time,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: AppColors.yellow,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            ActionButtonWidget(text: 'Save', width: double.infinity, onTap: () {
                              context.router.push(HomeRoute());
                            }),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
