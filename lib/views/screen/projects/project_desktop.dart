import 'package:flutter/material.dart';
import 'package:myapp/models/project_model.dart';
import 'package:myapp/services/api/network_utils.dart';
import 'package:myapp/views/screen/about/exports_about.dart';
import 'package:myapp/views/screen/projects/common_widgets.dart';
import 'package:myapp/views/screen/projects/components/custom_project_desktop_view.dart';

class ProjectDesktop extends StatelessWidget {
  final ProjectCommonWidgets commonWidgets = new ProjectCommonWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: commonWidgets.futureBuilderPageViewWidget(DeviceType.Dekstop),
    );
  }
}
