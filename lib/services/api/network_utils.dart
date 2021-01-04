import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/project_model.dart';
import 'package:myapp/models/skill_model.dart';

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

  Future<List<Project>> fetchProjects(String query) async {
    final results = await getRequest(path: "project");
    return results.map<Project>((e) => Project.fromJson(e)).toList();
  }

  Future<List<Skill>> fetchSkills(String query) async {
    final results = await getRequest(path: "skill");
    return results.map<Skill>((e) => Skill.fromJson(e)).toList();
  }

  ///The method defined to fetch data from API
  Future<List<dynamic>> getRequest({@required String path, Map<String, String> parameters}) async {
    final uri = Uri.http(getApiUrl(), path, parameters);
    http.Response response = await http.get(uri, headers: _headers);
    //final results = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(response.body);

    return jsonObject;
  }

  /// Deined headers required for reqeust.
  // TODOChange the CORS header when deployed
  Map<String, String> get _headers => {
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "localhost:8080",
      };
}
