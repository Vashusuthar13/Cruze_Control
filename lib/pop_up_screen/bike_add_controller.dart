import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BikeAddController extends GetxController {
  var bikeModels = <String>[].obs;
  var selectedModel = Rxn<String>();

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

          print("Models: ${bikeModels.join(', ')}");
        } else {
          bikeModels.clear();
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
