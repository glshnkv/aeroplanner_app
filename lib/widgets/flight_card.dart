import 'package:aeroplanner_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlightCard extends StatelessWidget {
  final String cityDeparture;
  final String countryDeparture;
  final DateTime timeDeparture;
  final String cityArrival;
  final String countryArrival;
  final DateTime timeArrival;
  final void Function()? onTap;

  const FlightCard(
      {super.key,
      required this.cityDeparture,
      required this.countryDeparture,
      required this.timeDeparture,
      required this.cityArrival,
      required this.countryArrival,
      required this.timeArrival,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Duration _difference =
        timeArrival.difference(timeDeparture);
    int hours = _difference.inHours % 24;
    int minutes = _difference.inMinutes % 60;
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white8,
          border: Border.all(color: AppColors.white14, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cityDeparture,
                        style: TextStyle(
                          color: AppColors.white40,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        countryDeparture,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${timeDeparture.hour}:${timeDeparture.minute}',
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.yellow14,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      child: SvgPicture.asset(
                        'assets/images/elements/airplane-takeoff.svg',
                        width: 30,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${hours}h ${minutes}min',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        cityArrival,
                        style: TextStyle(
                          color: AppColors.white40,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        countryArrival,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${timeArrival.hour}:${timeArrival.minute}',
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.white14,
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'See details',
                  style: TextStyle(
                    color: AppColors.yellow,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
