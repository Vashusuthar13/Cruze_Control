import 'dart:convert';
import 'package:cruze_control/_models/weather_model.dart';
import 'package:cruze_control/utills/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import '../../../utills/widgets/on_off_button/on_off_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  Future<bool> requestPermission() async {
    var status = await Permission.phone.request();

    return switch (status) {
      PermissionStatus.denied ||
      PermissionStatus.restricted ||
      PermissionStatus.limited ||
      PermissionStatus.permanentlyDenied =>
        false,
      PermissionStatus.provisional || PermissionStatus.granted => true,
    };
  }

  Future<WeatherModel>? weathermodel;
  late String _currentLocation;

  @override
  void initState() {
    super.initState();
    if (weathermodel == null) {
      _getLocationAndFetchWeather();
    }
    ;
  }

  void _getLocationAndFetchWeather() async {
    try {
      Position position = await _determinePosition();
      setState(() {
        _currentLocation = "${position.latitude},${position.longitude}";
        weathermodel = weather(_currentLocation);
      });
    } catch (e) {
      setState(() {
        _currentLocation = "Error: ${e.toString()}";
      });
    }
  }

  Future<WeatherModel> weather(String location) async {
    final response = await http.get(Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=dd2bdb5aad2f43d1ae4121757251705&q=$location',
    ));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                        const  SizedBox(
                          width: 10,
                        ),
                        FutureBuilder<WeatherModel>(
                          future: weathermodel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    snapshot.data!.name.toString(),
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    snapshot.data!.tempC.toInt().toString() +
                                        '°c' +
                                        ', ' +
                                        snapshot.data!.condition.toString(),
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                '${snapshot.error}',
                                style: TextStyle(color: Colors.white),
                              );
                            }

                            return const Text(
                              'Loading..',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            );
                          },
                        ),
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
            const  SizedBox(
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
                    const   Text(
                      'Hunter 350',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                       Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const   Text(
                          '30kmpl',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                              color: Color(0xffEFEFEF)),
                        ),
                          RichText(
                            text: const TextSpan(
                                text: 'Total',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                                children: [
                              TextSpan(
                                  text: ' 255km',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white))
                            ])),
                      ],
                    ),
                    const  SizedBox(
                      height: 20,
                    ),
                    const  Divider(
                      height: 0.1,
                      color: Color(0xff525252),
                    ),
                  const  SizedBox(
                      height: 10,
                    ),
                    const  Text('Last Ride',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    const  SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: const TextSpan(
                                text: 'Avg',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                                children: [
                              TextSpan(
                                  text: ' 26kmpl',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffF2CE60)))
                            ])),
                        RichText(
                            text: const TextSpan(
                                text: 'Distance',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                                children: [
                              TextSpan(
                                  text: ' 18km',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffF2CE60)))
                            ])),
                        RichText(
                            text: const TextSpan(
                                text: 'Speed',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                                children: [
                              TextSpan(
                                  text: ' 74km/h',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffF2CE60)))
                            ])),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const   SizedBox(
              height: 50,
            ),
            StartButton(),
            Container(
              width: 300,
              height: 170,
              child: Image.asset(
                'assets/images/hunter.png',
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled
    throw Exception('Location services are disabled.');
  }

  // Check permission
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied
      throw Exception('Location permissions are denied.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are permanently denied
    throw Exception('Location permissions are permanently denied.');
  }

  // When permissions are granted, get current position
  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}
