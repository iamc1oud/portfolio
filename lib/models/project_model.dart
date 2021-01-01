/// This model is defined for project retreived from api.
class Project {
  final int id;
  final String name;
  final String description;
  final String githublink;
  final List<String> screenshots;

  Project.fromJson(Map json)
      : id = json['projectId'],
        name = json['projectName'],
        description = json['projectDescription'],
        githublink = json['projectGitHubLink'],
        screenshots = json['screenShotLinks'];
}
