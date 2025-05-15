import 'package:cruze_control/utills/app_styles/app_colors.dart';
import 'package:cruze_control/utills/widgets/call_logs_card/call_logs_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/widgets.dart';
import '../../../../utills/widgets/rides_status_card/ride_status_card.dart';

class MyRidesPage extends StatelessWidget {
  final List<String> vechileList = [
    'Altroz',
    'Hunter 350',
    'Jupiter',
  ];

  final List<String> typeList = [
    'Max Distance',
    'Max Time',
    'Top Speed',
  ];

  MyRidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1F1F1F),
        body: Padding(
          padding:  EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField2<String>(
                      items: vechileList
                          .map((item) => DropdownMenuItem<String>(
                          value: item, child: Text(item,style: TextStyle(color: Colors.white70),)))
                          .toList(),
                      hint: Text(
                        'Select Vechile',
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'please select your vechile';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.mainGrey
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  Expanded(
                    child: DropdownButtonFormField2<String>(
                      items: typeList
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item,style: TextStyle(color: Colors.white70),)))
                          .toList(),
                      hint: Text(
                        'Select Type',
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          )
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'please your view type';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.mainGrey
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),


              RideStatusCard(),
              SizedBox(
                height: 20,
              ),
              RideStatusCard(),
            ],
          ),
        ));
  }
}
