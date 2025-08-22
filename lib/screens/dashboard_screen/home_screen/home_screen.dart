import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruze_control/controllers/location_track_conrtoller.dart';
import 'package:cruze_control/controllers/user_controller.dart';
import 'package:cruze_control/models/weather_model.dart';
import 'package:cruze_control/pop_up_screen/pop_up_screen.dart';
import 'package:cruze_control/utills/app_styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import '../../../utills/widgets/on_off_button/on_off_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  Future<WeatherModel>? weathermodel;
  late String _currentLocation;

  final LocationController locationController = Get.put(LocationController());
  final userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    _getLocationAndFetchWeather();
    loadBikes();
  }

  var latestBike = Rxn<Map<String, dynamic>>();


  Future<void> loadBikes() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('bikes')
        .orderBy('createdAt', descending: true)
        .get();

    if (snapshot.docs.isNotEmpty) {
      latestBike.value = snapshot.docs.first.data();
    } else {
      latestBike.value = null;
    }
  }


  /// Request phone permission
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

  /// Get current location and fetch weather
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
      throw Exception('Failed to load weather data Please check');
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      /// ✅ Case 1: First login → Show popup once + empty screen
      if (userController.isFirstLogin.value) {
        Future.delayed(Duration.zero, () {
          if (Navigator.canPop(context)) return; // avoid multiple dialogs
         showAnimatedDialogBikeSelect(context);
        });

        return const Scaffold(
          body: Center(child: Text("Loading profile setup...")),
        );
      }


      return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
          child: Column(
            children: [
              /// Weather + Profile Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 170,
                    height: 65,
                    decoration: BoxDecoration(
                        color: const Color(0xff444444),
                        borderRadius: BorderRadius.circular(35)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg_icons/Vector.svg'),
                          const SizedBox(width: 10),
                          FutureBuilder<WeatherModel>(
                            future: weathermodel,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.name.toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${snapshot.data!.tempC.toInt()}°c, ${snapshot.data!.condition}',
                                      style: const TextStyle(
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
                                  style: const TextStyle(color: Colors.white),
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
                    backgroundColor: const Color(0xff444444),
                    child: SvgPicture.asset('assets/svg_icons/user.svg'),
                  )
                ],
              ),

              const SizedBox(height: 20),

              /// Bike Info Card
            Obx(() {
              final bike = latestBike.value;

              if (bike == null) {
                return const Center(
                  child: Text(
                    "No bike added yet!",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              return

                Container(
                  width: 370,
                  height: 180,
                  decoration: BoxDecoration(
                      color: const Color(0xff444444),
                      borderRadius: BorderRadius.circular(35)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bike['model'] ?? '',
                          style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text(
                              '${bike['mileage']} kmpl',
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
                        const SizedBox(height: 20),
                        const Divider(height: 0.1, color: Color(0xff525252)),
                        const SizedBox(height: 10),
                        const Text('Last Ride',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        const SizedBox(height: 10),

                        /// Stats Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() =>
                                RichText(
                                  text: TextSpan(
                                      text: 'Avg ',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                            text:
                                            '${locationController.avgMileage
                                                .value.toStringAsFixed(
                                                1)} km/L',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffF2CE60)))
                                      ]),
                                )),
                            Obx(() =>
                                RichText(
                                  text: TextSpan(
                                      text: 'Distance ',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                            text:
                                            ' ${(locationController
                                                .totalDistance.value / 1000)
                                                .toStringAsFixed(1)} km',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffF2CE60)))
                                      ]),
                                )),
                            Obx(() =>
                                RichText(
                                  text: TextSpan(
                                      text: 'Speed ',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                            text:
                                            ' ${(locationController.avgSpeed
                                                .value * 3.6).toInt()} km/h',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffF2CE60)))
                                      ]),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                );

            }),

              const SizedBox(height: 50),

              StartButton(),
              SizedBox(
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
    });
  }

  /// Location helper
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
}
