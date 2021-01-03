import 'package:flutter/material.dart';
import 'package:myapp/views/screen/projects/common_widgets.dart';

class ProjectMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProjectCommonWidgets commonWidgets = new ProjectCommonWidgets();
    return Scaffold(
      body: commonWidgets.futureBuilderPageViewWidget(DeviceType.Mobile),
    );
  }
}
