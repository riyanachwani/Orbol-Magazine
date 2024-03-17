import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl =
      'https://sephora.p.rapidapi.com/products/v2/list';

  Future<Product?> fetchProductDetails() async {
    // Replace with your actual RapidAPI key
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'X-RapidAPI-Key': "3ca469a592mshe8241b89ec2de98p1a48cdjsn82b5c9fd205f",
        'X-RapidAPI-Host': 'sephora.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      final productData1 = jsonData['data'][3]['attributes'];

      final productData = jsonData['data'][1]['attributes'];
      final productData2 = jsonData['data'][0]['attributes'];

      // Extracting data for PAGE2
      final imageUrl1 = productData1['image-urls'][1];
      final name1 = productData1['name'];
      final description1 = productData1['description'];

      // Extracting data for PAGE2
      final imageUrl = productData['image-urls'][0];
      final name = productData['name'];
      final description = productData['description'];

      // Extracting data for PAGE4

      final imageUrl2 = productData2['image-urls'][1];
      final description2 = productData1['name'];
      final imageUrl3 = productData2['image-urls'][1];
      final description3 = productData2['name'];

      // Create a Product object
      return Product(
        imageUrl1: imageUrl1,
        name1: name1,
        description1: description1,
        imageUrl: imageUrl,
        name: name,
        description: description,
        imageUrl2: imageUrl2,
        description2: description2,
        imageUrl3: imageUrl3,
        description3: description3,
      );
    } else {
      throw Exception('Failed to load product details');
    }
  }
}

// Define a Product class to hold the data
class Product {
  final String imageUrl1;
  final String name1;
  final String description1;
  final String imageUrl;
  final String name;
  final String description;
  final String imageUrl2;
  final String description2;
  final String imageUrl3;
  final String description3;

  const Product({
    required this.imageUrl1,
    required this.name1,
    required this.description1,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.imageUrl2,
    required this.description2,
    required this.imageUrl3,
    required this.description3,
  });
}
