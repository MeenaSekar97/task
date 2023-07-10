import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  static var client = http.Client();

  static Future<http.Response?> getItems() async {
    try {
      final response = await client.get(
        Uri.parse("https://dummyjson.com/products"),
      );
      return response;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }

  static Future<http.Response?> getDetail(String id) async {
    try {
      final response = await client.get(
        Uri.parse("https://dummyjson.com/products/$id"),
      );
      return response;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }
}
