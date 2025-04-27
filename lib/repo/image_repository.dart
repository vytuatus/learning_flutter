import 'dart:convert';
import 'dart:io';
import 'package:learning_flutter/models/image_model.dart';
import 'package:http/http.dart' as http;

class ImageRepository {
  Future<List<CustomImage>> getNetworkImages() async {
    try {
      print("starting to get response");
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/images'));
      List<CustomImage> imageList = [];
      if (response.statusCode == 200) {
        final List<dynamic> decodedImageList = json.decode(response.body) as List;
        imageList = decodedImageList.map((listItem) => CustomImage.fromJson(listItem)).toList();
        print(imageList[0].imageUrl);
        return imageList;
      } else {
        throw Exception('Failed to load images');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Failed to load images');
    } on FormatException {
      throw Exception('Bad response format');
    } catch (e) {
      print(e.toString());
      throw Exception('Unknown error occurred while fetching images: $e');
    }
  }
}