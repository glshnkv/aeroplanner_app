import 'package:aeroplanner_app/models/flight_model.dart';
import 'package:aeroplanner_app/router/router.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:aeroplanner_app/widgets/action_button_widget.dart';
import 'package:aeroplanner_app/widgets/app_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlansTab extends StatefulWidget {
  final FlightModel flight;

  const PlansTab({super.key, required this.flight});

  @override
  State<PlansTab> createState() => _PlansTabState();
}

class _PlansTabState extends State<PlansTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: widget.flight.notes.length == 0
              ? Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'You’re plans for free time',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    AppContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: AppColors.yellow14,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            child: SvgPicture.asset(
                              'assets/images/elements/note.svg',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Add plans for free time',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'It seems that the transfer time is very long, add plans for this period.',
                            style: TextStyle(
                              color: AppColors.white40,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          ActionButtonWidget(
                              text: 'Add plans',
                              width: double.infinity,
                              onTap: () {
                                context.router
                                    .push(AddPlanRoute(flight: widget.flight));
                              }),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'You’re plans for free time',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.router
                                .push(AddPlanRoute(flight: widget.flight));
                          },
                          child: Text(
                            'Add plan',
                            style: TextStyle(
                              color: AppColors.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      itemCount: widget.flight.notes!.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 15),
                      itemBuilder: (BuildContext context, int index) {
                        final note = widget.flight.notes![index];
                        return AppContainer(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/elements/note.svg',
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  note.title,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Text(
                                    note.description,
                                    style: TextStyle(
                                      color: AppColors.white40,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ));
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
