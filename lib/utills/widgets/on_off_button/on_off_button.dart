import 'dart:async';
import 'package:cruze_control/_models/call_logs_model.dart';
import 'package:cruze_control/controllers/call_logs_controller.dart';
import 'package:cruze_control/controllers/start_button_controller.dart';
import 'package:cruze_control/utills/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:another_telephony/telephony.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_state/phone_state.dart';

class StartButton extends StatefulWidget {
  const StartButton({super.key});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  final StartButtonController controller = Get.find();
  final CallLogsController callLogsController = Get.find();
  final Telephony telephony = Telephony.instance;

  Stream<PhoneState>? _phoneStateStream;
  StreamSubscription<PhoneState>? _phoneStateSubscription;

  final String customMessage = "I'm riding my bike, will call you back later.";

  Future<bool> requestPermission() async {
    var phoneStatus = await Permission.phone.request();
    var smsStatus = await Permission.sms.request();
    return phoneStatus.isGranted && smsStatus.isGranted;
  }

  void _handleIncomingCall(String number) async {
   try {
     await telephony.sendSms(
       to: number,
       message: customMessage,
     );
   }
   catch (e){
     print('$e');
   }

    callLogsController.addCall(CallModel(
      icon: 'assets/svg_icons/user.svg',
      number: number,
      time: getCurrentTime(),
      day: getCurrentDay(),
      onDelete: () {},
    ));
  }

  void _togglePower() async {

    if (controller.isOn.value) {
      await _phoneStateSubscription?.cancel();
      _phoneStateSubscription = null;
      _phoneStateStream = null;
      controller.turnOff();
    } else {
      bool granted = await requestPermission();
      if (!granted) return;

      _phoneStateStream = PhoneState.stream;
      _phoneStateSubscription = _phoneStateStream!.listen((PhoneState state) {


        try {
          if (state.status == PhoneStateStatus.CALL_INCOMING &&
              state.number != null) {
            print("PhoneState: ${state.status} from ${state.number}");
            _handleIncomingCall(state.number!);
          }
        } catch (e) {
          print('$e');
        }
      });

      controller.turnOn();
      showAnimatedDialog(context);
    }
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
  }

  String getCurrentDay() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    if (now.year == today.year &&
        now.month == today.month &&
        now.day == today.day) return "Today";
    if (now.year == yesterday.year &&
        now.month == yesterday.month &&
        now.day == yesterday.day) return "Yesterday";
    return "${_getMonthName(now.month)} ${now.day}";
  }

  String _getMonthName(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
  }

  @override
  void dispose() {
    _phoneStateSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isOn = controller.isOn.value;

      return Column(
        children: [
          GestureDetector(
            onTap: _togglePower,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                boxShadow: [
                  if (isOn)
                    BoxShadow(
                      color: const Color(0xffF2CE60).withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                ],
                shape: BoxShape.circle,
                color: isOn ? const Color(0xffF2CE60) : Colors.transparent,
                border: Border.all(
                  color: AppColors.mainYellow,
                  width: 2,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svg_icons/powerbtn.svg',
                  color: isOn ? const Color(0xff1F1F1F) : Color(0xffF2CE60),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            isOn ? 'Bike Mode On' : 'Bike Mode Off',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color(0xff444444),
            ),
          )
        ],
      );
    });
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
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Ride Safe!',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),

            const SizedBox(
              height: 20,
            ),

            const Text(
              textAlign: TextAlign.center,
              'Please wear your hemate,\nwe wishes you a very safe journey✌️',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,),),

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
            }, child: Text('Okey! Thanks',style: TextStyle(color: AppColors.mainYellow),))

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


Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;


  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {

    throw Exception('Location services are disabled.');
  }


  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      throw Exception('Location permissions are denied.');
    }
  }

  if (permission == LocationPermission.deniedForever) {

    throw Exception('Location permissions are permanently denied.');
  }


  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}



