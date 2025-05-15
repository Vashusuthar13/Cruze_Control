import 'package:flutter/material.dart';

class RideStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: Color(0xff444444),
          borderRadius: BorderRadius.circular(12)),

      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hunter 350', style: TextStyle(fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w600,color: Colors.white),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text('1 Hour 34 Minutes', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w300,color: Color(0xffEFEFEF)),),
                RichText(text:

                TextSpan(
                    text: 'Distance', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w300,color: Colors.white),
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

            Text('Ride Details', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w600,color: Colors.white) ),

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
                    text: 'Top', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w300,color: Colors.white),
                    children: [

                      TextSpan(

                          text: ' 18km/h',
                          style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w600,color: Color(0xffF2CE60))
                      )
                    ]

                )

                ),


                RichText(text:

                TextSpan(
                    text: 'Avg', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w300,color: Colors.white),
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

            SizedBox(height: 10,),

            Divider(
              height: 0.1,
              color: Color(0xff525252),
            ),

            SizedBox(height: 5,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('12 May 2025', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w300,color: Colors.white),),
                Text('8:36AM - 10:12AM', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w300,color: Colors.white),),
              ],
            )

          ],
        ),
      ),
    );
  }

}