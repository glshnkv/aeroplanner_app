import 'package:aeroplanner_app/models/flight_model.dart';
import 'package:aeroplanner_app/router/router.dart';
import 'package:aeroplanner_app/screens/flight/flight_details/tabs/flight_details_tab.dart';
import 'package:aeroplanner_app/screens/flight/flight_details/tabs/plans_tab.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FlightDetailsScreen extends StatefulWidget {
  final FlightModel flight;

  const FlightDetailsScreen({super.key, required this.flight});

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
            toolbarHeight: 90,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white8,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.router.push(FlightsListRoute());
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios, color: AppColors.yellow),
                          Text(
                            'Your flights',
                            style: TextStyle(
                              color: AppColors.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Your flight',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 110),
                  ],
                ),
                SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.white14,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: AppColors.yellow,
                    labelColor: AppColors.yellow,
                    unselectedLabelColor: AppColors.white40,
                    tabs: [
                      Tab(height: 30, text: 'Flights'),
                      Tab(height: 30, text: 'Plans'),
                    ],
                  ),
                ),
              ],
            )
        ),
        body: TabBarView(
          children: [
            FlightDetailsTab(flight: widget.flight),
            PlansTab(flight: widget.flight),
          ],
        ),
      ),
    );
  }
}
