import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse('$baseUrl/photos'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Item> items = jsonList.map((json) => Item.fromJson(json)).toList().take(20).toList();

      // Item titles and descriptions
      for (var i = 0; i < items.length; i++) {
        items[i] = Item(
          id: items[i].id,
          title: getCustomTitle(i),
          url: items[i].url,
          thumbnailUrl: items[i].thumbnailUrl,
          description: getCustomDescription(i),
        );
      }

      return items;
    } else {
      throw Exception('Failed to load items');
    }
  }

  String getCustomTitle(int index) {
    List<String> customTitles = [
      "Allen Manzi",
      "James Kagabo",
      "Angel Keza Amariza",
      "Robert Mugenzi",
      "Fidel Kamara",
      "Nelly Butera",
      "Valentin Dushime",
      "Patrick Muhire",
      "Fredson Gisa Murenzi",
      "Peter Mugabo",
      "Nick Mugenzi",
      "Giselle Lights",
      "Yves Niyigena",
      "Pretty Delight",
      "Aime Murenzi",
      "Emmanuel Mugabo",
    ];

    return customTitles[index % customTitles.length];
  }

  String getCustomDescription(int index) {
    List<String> customDescriptions = [
      "A description for profile 1 to briefly talk about the person.",
      "A description for profile 2 to briefly talk about the person.",
      "A description for profile 3 to briefly talk about the person.",
      "A description for profile 4 to briefly talk about the person.",
      "A description for profile 5 to briefly talk about the person.",
      "A description for profile 6 to briefly talk about the person.",
      "A description for profile 7 to briefly talk about the person.",
      "A description for profile 8 to briefly talk about the person.",
      "A description for profile 9 to briefly talk about the person.",
      "A description for profile 10 to briefly talk about the person.",
      "A description for profile 11 to briefly talk about the person.",
      "A description for profile 12 to briefly talk about the person.",
      "A description for profile 13 to briefly talk about the person.",
      "A description for profile 14 to briefly talk about the person.",
      "A description for profile 15 to briefly talk about the person.",
      "A description for profile 16 to briefly talk about the person.",
    ];

    return customDescriptions[index % customDescriptions.length];
  }
}