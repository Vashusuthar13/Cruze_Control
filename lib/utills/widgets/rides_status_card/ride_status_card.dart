


import 'package:cruze_control/models/rides_model.dart';
import 'package:flutter/material.dart';

class RideStatusCard extends StatelessWidget {
  final RidesModel ride;

  const RideStatusCard({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff444444),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ride.VechileName,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ride.rideTime,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    color: Color(0xffEFEFEF),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Distance ',
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: ' ${ride.totalDistance}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(height: 0.1, color: Color(0xff525252)),
            const SizedBox(height: 10),
            const Text(
              'Ride Details',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Avg ',
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: ' ${ride.avgSpeed}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF2CE60),
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Top ',
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: ' ${ride.topSpeed}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF2CE60),
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Fuel ',
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: ' ${ride.fuel}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF2CE60),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 0.1, color: Color(0xff525252)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ride.date,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                Text(
                  ride.time,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
