import 'package:flutter/foundation.dart';
import 'package:myapp/models/project_model.dart';
import '../network_utils.dart';

class ProjectRepository {
  Future<String> addProject({@required Project project}) async {}
  Future<Map<String, dynamic>> fetchProjects() async {
    final results = await NetworkUtils().getRequest(path: 'project', parameters: {
      'Accept': 'application/json',
    });
  }
}
