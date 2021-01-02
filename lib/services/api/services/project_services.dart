import 'package:myapp/models/project_model.dart';
import 'package:myapp/services/api/repositories/project_repository.dart';

class ProjectServices {
  final ProjectRepository _projectRepository = new ProjectRepository();

  Future<Map<String, dynamic>> fetchProjects() async {
    return await _projectRepository.fetchProjects();
  }
}
