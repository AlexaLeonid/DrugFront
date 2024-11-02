import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> getDrugInfo(String name) async {
  final url = Uri.parse('http://b257-188-17-211-72.ngrok-free.app/v1/drug/$name');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Drug name: ${data['name']}");
      print("Active ingredients:");
      for (var ingredient in data['active_ingredients']) {
        print("- ${ingredient['name']}, dosage: ${ingredient['dosage']}");
      }
    } else {
      print("Error: ${response.statusCode}");
    }
  } catch (e) {
    print("Failed to fetch drug info : $e");
  }
}