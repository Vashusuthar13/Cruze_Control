import 'package:cruze_control/utills/app_styles/app_colors.dart';
import 'package:cruze_control/utills/widgets/on_off_button/on_off_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool _ison = false;
  bool _isSwtichOn = false;

  void _togglePower() {
    setState(() {
      _ison = !_ison;
      showAnimatedDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 2,
          centerTitle: true,
          title: Text(
            'Setting',
            style: TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.lightGrey),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.mainGrey,
                    child: SvgPicture.asset('assets/svg_icons/user.svg'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anand Suthar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'anandsuthar13@gmail.com',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Auto Reply',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Switch(
                  activeTrackColor: AppColors.mainYellow,
                  value: _isSwtichOn,
                  onChanged: (value) {
                    setState(() {
                      _isSwtichOn = value;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 10,),

            Divider(
              height: 1,
              thickness: 0.5,
              color: Colors.grey,
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weather Alert',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Switch(
                  activeTrackColor: AppColors.mainYellow,
                  value: _isSwtichOn,
                  onChanged: (value) {
                    setState(() {
                      _isSwtichOn = value;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 10,),

            Divider(
              height: 1,
              thickness: 0.5,
              color: Colors.grey,
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Parking Detection',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Switch(
                  activeTrackColor: AppColors.mainYellow,
                  value: _isSwtichOn,
                  onChanged: (value) {
                    setState(() {
                      _isSwtichOn = value;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 10,),

            Divider(
              height: 1,
              thickness: 0.5,
              color: Colors.grey,
            ),

            SizedBox(height: 20,),

            GestureDetector(
              onTap:
                _togglePower,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Set Emergency Contact',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.arrow_forward_rounded,color: Colors.white,),

                ],
              ),
            ),

            SizedBox(height: 20,),

            Divider(
              height: 1,
              thickness: 0.5,
              color: Colors.grey,
            ),


            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Set Custom Message',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Icon(Icons.arrow_forward_rounded,color: Colors.white,),

              ],
            ),

            SizedBox(height: 20,),

            Divider(
              height: 1,
              thickness: 0.5,
              color: Colors.grey,
            ),

          ],
        ),
      ),
    );
  }
}



class DiloageBox extends StatefulWidget {
  const DiloageBox({super.key});

  @override
  State<DiloageBox> createState() => _DiloageBoxState();
}

class _DiloageBoxState extends State<DiloageBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: AppColors.lightGrey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Emergency Contact',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),

              SizedBox(
                height: 10,
              ),

              Text(
                textAlign: TextAlign.center,
                'Please Enter Contact number',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w300,),),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 60,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.call,color: AppColors.mainYellow,),
                    hintText: 'Enter Mobile Number',
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColors.mainYellow,
                      )
                    ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.mainYellow,
                        ),
                      ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColors.mainYellow,
                      )
                    )
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),


              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.mainGrey,
                      side: BorderSide(
                          color: AppColors.mainYellow
                      )
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }, child: Text('Confirm',style: TextStyle(color: AppColors.mainYellow),))

            ],
          ),
        )
    );
  }
}

void showAnimatedDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Ride Safe Dialog",
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: DiloageBox(),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}
