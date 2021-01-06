import 'package:flutter/material.dart';
import 'package:myapp/utils/consts.dart';
import 'package:myapp/views/screen/projects/common_widgets.dart';

class ProjectMobile extends StatelessWidget {
  const ProjectMobile({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ProjectCommonWidgets commonWidgets = new ProjectCommonWidgets();
    return Scaffold(
      body: commonWidgets.futureBuilderPageViewWidget(DeviceType.Mobile, size),
    );
  }
}
