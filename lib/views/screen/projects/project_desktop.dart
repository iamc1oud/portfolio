import 'package:flutter/material.dart';
import 'package:myapp/utils/consts.dart';
import 'package:myapp/views/screen/about/exports_about.dart';
import 'package:myapp/views/screen/projects/common_widgets.dart';

class ProjectDesktop extends StatelessWidget {
  final ProjectCommonWidgets commonWidgets = new ProjectCommonWidgets();

  ProjectDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: commonWidgets.futureBuilderPageViewWidget(DeviceType.Desktop, size),
    );
  }
}
