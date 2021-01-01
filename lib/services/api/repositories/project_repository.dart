import 'package:flutter/foundation.dart';
import 'package:myapp/models/project_model.dart';
import '../network_utils.dart';

class ProjectRepository {
  Future<String> addProject({@required Project project}) async {}
  Future<List<Project>> fetchProjects() async {
    final results = await NetworkUtils().getRequest(path: 'project');
    print(results);
  }
}
