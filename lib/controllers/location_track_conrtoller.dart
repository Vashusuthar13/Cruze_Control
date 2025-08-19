
import 'dart:async';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  StreamSubscription<Position>? _positionStream;
  Position? _lastPosition;

  RxDouble totalDistance = 0.0.obs; // in meters
  RxDouble topSpeed = 0.0.obs; // in m/s
  RxDouble lastTouchTopSpeed = 0.0.obs; // in m/s
  RxDouble avgSpeed = 0.0.obs; // in m/s
  RxDouble fuelUsed = 0.0.obs; // in liters
  RxDouble avgMileage = 0.0.obs; // in km/L

  RxBool isTracking = false.obs;
  DateTime? _startTime;

  final double bikeMileage = 30.0; // km per liter

  void startTracking() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }

    totalDistance.value = 0.0;
    topSpeed.value = 0.0;
    lastTouchTopSpeed.value = 0.0;
    avgSpeed.value = 0.0;
    fuelUsed.value = 0.0;
    _lastPosition = null;
    _startTime = DateTime.now();

    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 5,
      ),
    ).listen((Position position) {
      if (_lastPosition != null) {
        double distance = Geolocator.distanceBetween(
          _lastPosition!.latitude,
          _lastPosition!.longitude,
          position.latitude,
          position.longitude,
        );
        totalDistance.value += distance;
      }

      fuelUsed.value = (totalDistance.value / 1000) / bikeMileage;

// Update avg mileage
      if (fuelUsed.value > 0) {
        avgMileage.value = (totalDistance.value / 1000) / fuelUsed.value;
      } else {
        avgMileage.value = 0.0;
      }

      // Update speeds
      if (position.speed > topSpeed.value) {
        topSpeed.value = position.speed;
      }
      lastTouchTopSpeed.value = position.speed;

      // Update avg speed
      if (_startTime != null) {
        final duration = DateTime.now().difference(_startTime!).inSeconds;
        if (duration > 0) {
          avgSpeed.value = totalDistance.value / duration; // m/s
        }
      }

      // Update fuel usage
      fuelUsed.value = (totalDistance.value / 1000) / bikeMileage; // in liters

      _lastPosition = position;
    });

    isTracking.value = true;
  }

  void stopTracking() {
    _positionStream?.cancel();
    _positionStream = null;
    isTracking.value = false;

    print('🏁 Tracking stopped.');
    print('📏 Distance: ${(totalDistance.value / 1000).toStringAsFixed(2)} km');
    print('🚀 Top Speed: ${(topSpeed.value * 3.6).toStringAsFixed(2)} km/h');
    print('⚡️ Avg Speed: ${(avgSpeed.value * 3.6).toStringAsFixed(2)} km/h');
    print('⛽️ Fuel Used: ${fuelUsed.value.toStringAsFixed(2)} L');
  }

  void toggleTracking() {
    if (isTracking.value) {
      stopTracking();
    } else {
      startTracking();
    }
  }

  @override
  void onClose() {
    _positionStream?.cancel();
    super.onClose();
  }
}
