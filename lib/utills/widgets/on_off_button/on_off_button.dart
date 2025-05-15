import 'package:cruze_control/utills/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class StartButton extends StatefulWidget{

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  bool _ison = false;

  void _togglePower() {
    setState(() {
      _ison = !_ison;
      showAnimatedDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: _togglePower,
            child: Container(
              width: 150,
              height: 150,

              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:  _ison ? Color(0xffF2CE60).withOpacity(0.2) : Colors.transparent, // shadow color
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 4), // shadow position
                    ),
                  ],
                shape: BoxShape.circle,
                color: _ison? Color(0xffF2CE60) : Colors.transparent,
                border: Border.all(
                  color: AppColors.mainYellow,
                  width: 2
                )
              ),
              child: Container(
                  width: 40,
                  height: 40,
                  child: Center(child: SvgPicture.asset('assets/svg_icons/powerbtn.svg',color: _ison? Color(0xff1F1F1F) : Color(0xffF2CE60),))),

            ),
          ),

          SizedBox(
            height: 10,


          ),

          Text( _ison? 'Bike Mode On' : 'Bike Mode Off',style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600,fontSize: 24,color: Color(0xff444444)),)

        ],
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
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Ride Safe!',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),

            SizedBox(
              height: 20,
            ),

            Text(
              textAlign: TextAlign.center,
              'Please wear your hemate,\nwe wishes you a very safe journey✌️',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,),),

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



