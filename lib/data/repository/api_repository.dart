import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ApiRepository {
  final String _baseUrl = 'https://v1.hockey.api-sports.io';
  final String _apiKey = '60e0936d9fe4a33c0c2f2ace525b8492';

  Future<List<dynamic>> fetchMatches(String date) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/games?date=$date'),
      headers: {'x-rapidapi-key': _apiKey},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['response'];
    } else {
      throw Exception('Failed to load matches');
    }
  }
}

String formatDateTime(String dateTimeString) {
  final dateTime = DateTime.parse(dateTimeString);
  final formatter = DateFormat('dd.MM.yy, kk:mm');
  return formatter.format(dateTime);
}

String formatDateTimeCalendar(String dateTimeString) {
  final dateTime = DateTime.parse(dateTimeString);
  final formatter = DateFormat('dd.MM.yy');
  return formatter.format(dateTime);
}
