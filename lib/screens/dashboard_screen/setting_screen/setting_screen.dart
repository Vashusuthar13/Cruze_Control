import 'package:cruze_control/controllers/setting_conrtoller.dart';
import 'package:cruze_control/utills/app_styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../login_screen/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool _ison = false;
  final SettingController controller = Get.put(SettingController());

  void _togglePower() {
    setState(() {
      _ison = !_ison;
      showAnimatedDialog(context);
    });
  }

  void logoutUser() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() =>  LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 2,
          centerTitle: true,
          title:  const Text(
            'Setting',
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Padding(
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
                    const  SizedBox(
                      width: 20,
                    ),
                    const   Column(
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
                    ),

                  ],
                ),
              ),
              const   SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const    Text(
                    'Auto Reply',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Obx(()=> Switch(
                      thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return AppColors.mainGrey;
                        }
                        return Colors.grey;
                      }),
                    activeTrackColor: AppColors.mainYellow,
                    value: controller.autoReply.value,
                    onChanged: (value) {
                      controller.autoReplTap();
                    }
                  )
                  )
                ],
              ),

              const  SizedBox(height: 10,),

              const  Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),

              const   SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const   Text(
                    'Weather Alert',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Obx(()=> Switch(
                      thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return AppColors.mainGrey;
                        }
                        return Colors.grey;
                      }),
                      activeTrackColor: AppColors.mainYellow,
                      value: controller.weatherAlert.value,
                      onChanged: (value) {
                        controller.weatherAlertTap();
                      }
                  )
                  )
                ],
              ),

              const   SizedBox(height: 10,),

              const   Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),

              const  SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const   Text(
                    'Parking Detection',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Obx(()=> Switch(
                      thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return AppColors.mainGrey;
                        }
                        return Colors.grey;
                      }),
                      activeTrackColor: AppColors.mainYellow,
                      value: controller.parkingAlert.value,
                      onChanged: (value) {
                        controller.parkingAlertTap();
                      }
                  )
                  )
                ],
              ),

              const  SizedBox(height: 10,),

              const  Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),

              SizedBox(height: 20,),

              GestureDetector(
                onTap:
                  _togglePower,
                child: const Row(
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

            const  SizedBox(height: 20,),

              const  Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),


              const SizedBox(height: 20,),

              const  Row(
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

              const SizedBox(height: 20,),

              const Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),

              const SizedBox(height: 20,),

              GestureDetector(
                onTap: logoutUser,
                child: const  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(Icons.logout,color: Colors.white,),

                  ],
                ),
              ),

              const SizedBox(height: 20,),

              const Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),

            ],
          ),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const  Text('Emergency Contact',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),

                const  SizedBox(
                  height: 10,
                ),

                const   Text(
                  textAlign: TextAlign.center,
                  'Please Enter Contact number',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w300,),),

                const  SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call,color: AppColors.mainYellow,),
                      hintText: 'Enter Mobile Number',
                      hintStyle: const TextStyle(color: Colors.grey),
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

                const  SizedBox(
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
      return const Center(
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

