import 'package:cruze_control/utills/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utills/widgets/on_off_button/on_off_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 170,
                  height: 65,
                  decoration: BoxDecoration(
                      color: Color(0xff444444),
                      borderRadius: BorderRadius.circular(35)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg_icons/Vector.svg'),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                    'assets/svg_icons/location.svg'),
                                Text(
                                  'Jaipur',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            Text(
                              '25°C, Cloudy',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 27.5,
                  backgroundColor: Color(0xff444444),
                  child: SvgPicture.asset('assets/svg_icons/user.svg'),
                )
              ],
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              width: 370,
              height: 180,
              decoration: BoxDecoration(
                  color: Color(0xff444444),
                  borderRadius: BorderRadius.circular(35)),

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hunter 350', style: TextStyle(fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w700,color: Colors.white),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text('30kmpl', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w300,color: Color(0xffEFEFEF)),),
                        RichText(text:

                        TextSpan(
                            text: 'Total', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w300,color: Colors.white),
                            children: [

                              TextSpan(

                                  text: ' 255km',
                                  style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w600,color: Colors.white)
                              )
                            ]

                        )

                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Divider(
                      height: 0.1,
                      color: Color(0xff525252),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Text('Last Ride', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w600,color: Colors.white) ),

                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        RichText(text:

                        TextSpan(
                            text: 'Avg', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w300,color: Colors.white),
                            children: [

                              TextSpan(

                                  text: ' 26kmpl',
                                  style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w600,color: Color(0xffF2CE60))
                              )
                            ]

                        )

                        ),

                        RichText(text:

                        TextSpan(
                            text: 'Distance', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w300,color: Colors.white),
                            children: [

                              TextSpan(

                                  text: ' 18km',
                                  style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w600,color: Color(0xffF2CE60))
                              )
                            ]

                        )

                        ),


                        RichText(text:

                        TextSpan(
                            text: 'Speed', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w300,color: Colors.white),
                            children: [

                              TextSpan(

                                  text: ' 74km/h',
                                  style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w600,color: Color(0xffF2CE60))
                              )
                            ]

                        )

                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 50,
            ),

            StartButton(),

            Container(
              width: 300,
              height: 170,
              child: Image.asset('assets/images/hunter.png',fit: BoxFit.fill,),
            )



          ],
        ),
      ),
    );

  }
}
