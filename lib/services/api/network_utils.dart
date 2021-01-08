import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/project_model.dart';
import 'package:myapp/models/skill_model.dart';
import 'package:dio/dio.dart';
import 'package:myapp/views/screen/about/exports_about.dart';

enum ProjectStatus { development, production }

class NetworkUtils {
  String apiUrl;
  ProjectStatus currentProjectStatus = ProjectStatus.production;

  /// Returns the base url for using api services
  String getApiUrl() {
    if (currentProjectStatus == ProjectStatus.development) {
      apiUrl = 'localhost:8080';
    } else {
      //TODOChange the apiUrl when api is deployed
      apiUrl = "https://iamcloud.herokuapp.com";
    }
    return apiUrl;
  }

  Future<List<Project>> fetchProjects(String query) async {
    final results = await getProjects(path: "project");
    return results.map<Project>((e) => Project.fromJson(e)).toList();
  }

  Future<List<Skill>> fetchSkills(String query) async {
    final results = await getSkills(path: "skill");
    return results.map<Skill>((e) => Skill.fromJson(e)).toList();
  }

  ///The method defined to fetch data from API
  Future<List<dynamic>> getSkills({@required String path, Map<String, String> parameters}) async {
    // final uri = Uri.http(getApiUrl(), path, parameters);
    // final results = await http.get(uri, headers: _headers);
    String data = await rootBundle.loadString("assets/jsons/skills.json");
    print(data);
    final jsonObject = json.decode(data);
    return jsonObject;
  }

  Future<List<dynamic>> getProjects({@required String path, Map<String, String> parameters}) async {
    // final uri = Uri.http(getApiUrl(), path, parameters);
    // final results = await http.get(uri, headers: _headers);
    String data = await rootBundle.loadString("assets/jsons/projects.json");
    print(data);
    final jsonObject = json.decode(data);
    return jsonObject;
  }

  /// Deined headers required for reqeust.
  // TODOChange the CORS header when deployed
  Map<String, String> get _headers => {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'};
}
