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

                const TextSpan(
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

            const SizedBox(
              height: 20,
            ),

           const Divider(
              height: 0.1,
              color: Color(0xff525252),
            ),

           const SizedBox(
              height: 10,
            ),

            const   Text('Ride Details', style: TextStyle(fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w600,color: Colors.white) ),

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                RichText(text:

                const  TextSpan(
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

                const  TextSpan(
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

                const  TextSpan(
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

            const  SizedBox(height: 10,),

            const  Divider(
              height: 0.1,
              color: Color(0xff525252),
            ),

            const  SizedBox(height: 5,),

            const  Row(
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