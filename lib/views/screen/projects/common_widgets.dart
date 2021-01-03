import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:myapp/models/project_model.dart';
import 'package:myapp/services/api/network_utils.dart';
import 'components/custom_project_view.dart';

enum SliderDirection { Left, Right }

class ProjectCommonWidgets {
  static final PageController _projectSliderController = new PageController(initialPage: 0);

  Widget customSlider(IconData icon, SliderDirection direction) {
    return InkWell(
      onTap: () {
        if (direction == SliderDirection.Left) {
          _projectSliderController.previousPage(curve: Curves.easeIn, duration: Duration(milliseconds: 300));
        } else
          _projectSliderController.nextPage(curve: Curves.easeIn, duration: Duration(milliseconds: 300));
      },
      child: Container(
          height: 50,
          width: 60,
          child: Center(
              child: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ))),
    );
  }

  Widget futureBuilderPageViewWidget() {
    return FutureBuilder(
        future: NetworkUtils().fetchProjects(""),
        // ignore: missing_return
        builder: (context, snapshot) {
          List<Project> data = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              return Stack(
                children: [
                  PageView(
                      onPageChanged: (int currentPage) {
                        print(currentPage);
                      },
                      allowImplicitScrolling: true,
                      controller: _projectSliderController,
                      scrollDirection: Axis.horizontal,
                      children: data
                          .map((e) => CustomProjectCard(
                              image: Image.network(e.projectBackgroundImage),
                              appPreviews: e.screenShotLinks,
                              description: e.projectDescription,
                              gitHubLink: e.projectGitHubLink,
                              technologiesUsed: ["Flutter", "Kotlin"],
                              title: e.projectName))
                          .toList()),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      customSlider(CupertinoIcons.arrow_left_circle, SliderDirection.Left),
                      customSlider(CupertinoIcons.arrow_right_circle, SliderDirection.Right),
                    ]),
                  )
                ],
              );
              break;
            case ConnectionState.none:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
          }
        });
  }
}
