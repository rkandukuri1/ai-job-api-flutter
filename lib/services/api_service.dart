import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl = "http://127.0.0.1:8000";

  static Future<List<dynamic>> fetchJobs() async {

    final response = await http.post(

      Uri.parse('$baseUrl/jobs'),

      headers: {
        "Content-Type": "application/json",
      },

      body: jsonEncode({
        "query": "python developer",
        "skills": "python, fastapi"
      }),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      return data["jobs"];

    } else {

      throw Exception(
        "Failed to load jobs: ${response.body}"
      );
    }
  }
}