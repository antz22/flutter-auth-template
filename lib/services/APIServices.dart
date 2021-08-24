import 'dart:convert';
import '../models/sample_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class APIServices {
  // Emulator
  static const API_BASE_URL = 'http://10.0.2.2:5000';
  // USB Debugging
  // static const API_BASE_URL = 'http://192.168.1.126:5000';

  Future<List<dynamic>?> getSampleModel() async {
    final storage = new FlutterSecureStorage();
    final token = await storage.read(key: 'restAPI');
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Token " + token!
    };
    final url = Uri.parse(API_BASE_URL + '/api/v1/get-sample-models/');
    final response = await http.get(url, headers: headers);
    List<dynamic> data = json.decode(response.body);
    List<SampleModel> sampleModels =
        data.map((sampleModel) => SampleModel.fromJson(sampleModel)).toList();
    return sampleModels;
  }

  Future<String> postSampleModel(String sampleField) async {
    final storage = new FlutterSecureStorage();
    final token = await storage.read(key: 'restAPI');
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Token " + token!
    };
    final body = json.encode({
      'sampleField': sampleField,
    });
    final url = Uri.parse(API_BASE_URL + '/api/v1/get-sample-models/');
    final response = await http.post(url, headers: headers, body: body);
    Map<String, dynamic> data = json.decode(response.body);
    return data['body'];
  }
}
