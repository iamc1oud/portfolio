class Project {
  int projectId;
  String projectName;
  String projectDescription;
  String projectGitHubLink;
  List<String> screenShotLinks;
  String projectBackgroundImage;
  List<String> technologiesUsed;

  Project(
      {this.projectId,
      this.projectName,
      this.projectDescription,
      this.projectGitHubLink,
      this.screenShotLinks,
      this.projectBackgroundImage,
      this.technologiesUsed});

  Project.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    projectName = json['projectName'];
    projectDescription = json['projectDescription'];
    projectGitHubLink = json['projectGitHubLink'];
    screenShotLinks = json['screenShotLinks'].cast<String>();
    projectBackgroundImage = json['projectBackgroundImage'];
    technologiesUsed = json['technologiesUsed'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectId'] = this.projectId;
    data['projectName'] = this.projectName;
    data['projectDescription'] = this.projectDescription;
    data['projectGitHubLink'] = this.projectGitHubLink;
    data['screenShotLinks'] = this.screenShotLinks;
    data['projectBackgroundImage'] = this.projectBackgroundImage;
    data['technologiesUsed'] = this.technologiesUsed;
    return data;
  }
}
