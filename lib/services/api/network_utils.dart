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
      apiUrl = "localhost:8080";
    } else {
      //TODOChange the apiUrl when api is deployed
      apiUrl = "DEPLOYED WEBSITE URL";
    }
    return apiUrl;
  }

  Future<Map> getRequest({@required String path, Map<String, String> parameters = null}) async {
    final uri = Uri.http(getApiUrl(), path, parameters);
    final results = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Map<String, String> get _headers => {
        'Accept': 'application/json',
      };
}
