import 'package:flutter/material.dart';
import 'package:myapp/views/screen/projects/project_desktop.dart';
import 'package:myapp/views/screen/projects/project_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Project extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: ProjectDesktop(),
      mobile: ProjectMobile(),
    );
  }
}
