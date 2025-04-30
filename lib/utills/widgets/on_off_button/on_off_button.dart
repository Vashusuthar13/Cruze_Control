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
                  color: Color(0xffF2CE60),
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