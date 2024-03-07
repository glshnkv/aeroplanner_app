import 'package:aeroplanner_app/router/router.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:aeroplanner_app/widgets/action_button_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          'Settings',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: AppColors.yellow14,
                  border: Border.all(color: AppColors.white14, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppColors.yellow14,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child:
                        SvgPicture.asset('assets/images/elements/comment.svg'),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Give us your feedback',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 230,
                            child: Text(
                              'Help us improve the app with your opinion',
                              style: TextStyle(
                                color: AppColors.white40,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ActionButtonWidget(
                          text: 'Rate us', width: 105, onTap: () {}),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white8,
                  border: Border.all(color: AppColors.white14, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.yellow14,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      child:
                          SvgPicture.asset('assets/images/elements/share.svg'),
                    ),
                    title: Text(
                      'Share with friends',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,
                        color: AppColors.white40),
                  ),
                  Divider(
                    color: AppColors.white14,
                    height: 4,
                  ),
                  ListTile(
                    onTap: () {},
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.yellow14,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      child: SvgPicture.asset('assets/images/elements/doc.svg'),
                    ),
                    title: Text(
                      'Terms of use',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,
                        color: AppColors.white40),
                  ),
                  Divider(
                    color: AppColors.white14,
                    height: 4,
                  ),
                  ListTile(
                    onTap: () {},
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.yellow14,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      child:
                          SvgPicture.asset('assets/images/elements/guard.svg'),
                    ),
                    title: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,
                        color: AppColors.white40),
                  ),
                  Divider(
                    color: AppColors.white14,
                    height: 4,
                  ),
                  ListTile(
                    onTap: () {},
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.yellow14,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      child:
                          SvgPicture.asset('assets/images/elements/bell.svg'),
                    ),
                    title: Text(
                      'Send notification',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Switch(
                      onChanged: (value) {},
                      value: true,
                      activeColor: AppColors.white8,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
