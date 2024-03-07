import 'package:aeroplanner_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsCardWidget extends StatelessWidget {
  final String iconUrl;
  final String type;
  final String? country;
  final String? city;
  final DateTime? time;
  final DateTime? date;
  final String? airport;

  const DetailsCardWidget(
      {super.key,
      required this.iconUrl,
      required this.type,
      required this.time,
        required this.date,
        required this.airport,
      required this.country,
      required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white8,
          border: Border.all(color: AppColors.white14, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SvgPicture.asset(iconUrl),
                SizedBox(width: 5),
                Text(
                  type,
                  style: TextStyle(
                    color: AppColors.white40,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: AppColors.white14,
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${country}, ${city}',
                      style: TextStyle(
                        color: AppColors.white40,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${time?.hour}:${time?.minute}',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${date?.day}.${date?.month}.${date?.year}',
                      style: TextStyle(
                        color: AppColors.white40,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Airport',
                      style: TextStyle(
                        color: AppColors.white40,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${airport}',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
