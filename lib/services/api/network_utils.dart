import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

enum ProjectStatus { development, production }

class NetworkUtils {
  String apiUrl;
  ProjectStatus currentProjectStatus = ProjectStatus.development;

  /// Returns the base url for using api services
  String getApiUrl() {
    if (currentProjectStatus == ProjectStatus.development) {
      apiUrl = 'localhost:8080';
    } else {
      //TODOChange the apiUrl when api is deployed
      apiUrl = "DEPLOYED WEBSITE URL";
    }
    return apiUrl;
  }

  Future<Map<String, dynamic>> getRequest({@required String path, Map<String, String> parameters}) async {
    final uri = Uri.http(getApiUrl(), path, parameters);
    http.Response response = await http.get(uri, headers: _headers);
    //final results = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(response.body);
    print(jsonObject);
    return jsonObject;
  }

  Map<String, String> get _headers => {
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Methods": "POST, OPTIONS"
      };
}
