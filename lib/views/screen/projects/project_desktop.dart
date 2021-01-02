import 'package:flutter/material.dart';
import 'package:myapp/models/project_model.dart';
import 'package:myapp/services/api/network_utils.dart';
import 'package:myapp/views/screen/about/exports_about.dart';
import 'package:myapp/views/screen/projects/components/custom_project_view.dart';

// ignore: must_be_immutable
class ProjectDesktop extends StatelessWidget {
  final PageController _projectSliderController = new PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: NetworkUtils().fetchProjects(""),
          builder: (context, snapshot) {
            List<Project> data = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:
                return PageView(
                    controller: _projectSliderController,
                    scrollDirection: Axis.vertical,
                    children: data
                        .map((e) => CustomProjectCard(
                            image: Image.network(e.projectBackgroundImage),
                            appPreviews: e.screenShotLinks,
                            description: e.projectDescription,
                            gitHubLink: e.projectGitHubLink,
                            technologiesUsed: ["Flutter", "Kotlin"],
                            title: e.projectName))
                        .toList());
                break;
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _projectSliderController
              .animateToPage(_currentPage + 1,
                  duration: Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn)
              .catchError((e) => print("Layout issue"));
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle, gradient: LinearGradient(colors: [Color(0xFFB820FF), Color(0xFF8220FF)])),
          child: Icon(
            FlutterIcons.arrow_down_circle_fea,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
