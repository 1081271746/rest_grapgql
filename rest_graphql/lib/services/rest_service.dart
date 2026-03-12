import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/restaurant.dart';

class RestService {

  Future<List<Restaurant>> fetchRestaurants() async {

    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users")
    );

    if (response.statusCode == 200) {

      List data = json.decode(response.body);

      return data.map((e) => Restaurant.fromJson(e)).toList();

    } else {
      throw Exception("Error al cargar restaurantes");
    }
  }
}