import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BikeAddController extends GetxController {
  var bikeModels = <String>[].obs;
  var selectedModel = Rxn<String>();
  var selectedCompany = Rxn<String>();


  final nicknameController = TextEditingController();
  final mileageController = TextEditingController();


  Future<void> saveBike() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final bikeData = {
        'nickname': nicknameController.text,
        'company': selectedCompany.value,
        'model': selectedModel.value,
        'mileage': mileageController.text,
        'createdAt': FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('bikes')
          .add(bikeData);

      Get.snackbar("Success", "Bike added successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }


  Future<void> bikeSelect(String bikename) async {
    final url = Uri.parse("https://api.api-ninjas.com/v1/motorcycles?make=$bikename");
    const apikey = 'qL7AHy5P4GkkDexRKOB3CA==cmZovxKxAx02qzWg';

    try {
      final response = await http.get(
        url,
        headers: {'X-Api-Key': apikey},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is List && data.isNotEmpty) {

          bikeModels.value = data.map<String>((bike) => bike['model'].toString()).toList();

          selectedModel.value = null;

          print("Models: ${bikeModels.join(', ')}");
        } else {
          bikeModels.clear();
          selectedModel.value = null;
          print("⚠No bikes found for $bikename");
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print(" Exception: $e");
    }
  }
}
