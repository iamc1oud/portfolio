import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:myapp/models/project_model.dart';
import 'package:myapp/services/api/network_utils.dart';
import 'package:myapp/views/screen/projects/components/custom_project_mobile_view.dart';
import 'components/custom_project_desktop_view.dart';

enum SliderDirection { Left, Right }
enum DeviceType { Dekstop, Mobile }

class ProjectCommonWidgets {
  static final PageController _projectSliderController = new PageController(initialPage: 0);

  Widget customSlider(IconData icon, SliderDirection direction) {
    return InkWell(
      onTap: () {
        if (direction == SliderDirection.Left) {
          _projectSliderController.previousPage(curve: Curves.easeIn, duration: Duration(milliseconds: 500));
        } else
          _projectSliderController.nextPage(curve: Curves.easeIn, duration: Duration(milliseconds: 500));
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

  Widget futureBuilderPageViewWidget([DeviceType _deviceType, Size size]) {
    return FutureBuilder(
        future: NetworkUtils().fetchProjects(""),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              List<Project> data = snapshot.data;
              if (data == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Stack(
                children: [
                  Container(
                    height: size.height,
                    width: size.width,
                    color: Colors.white,
                    child: CustomPaint(
                      painter: EdgePainter(),
                    ),
                  ),
                  PageView(
                      allowImplicitScrolling: true,
                      controller: _projectSliderController,
                      scrollDirection: Axis.horizontal,
                      children: data
                          .map((e) => _deviceType == DeviceType.Dekstop
                              ? CustomProjectCard(
                                  image: Image.network(e.projectBackgroundImage),
                                  appPreviews: e.screenShotLinks,
                                  description: e.projectDescription,
                                  gitHubLink: e.projectGitHubLink,
                                  technologiesUsed: ["Flutter", "Kotlin"],
                                  title: e.projectName)
                              : CustomProjectMobileCard(
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

class EdgePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill; // Change this to fill
    paint.shader = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.blue[500],
        Colors.blue[900],
      ],
    ).createShader(rect);
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2.4, size.height);
    path.lineTo(0, size.height * 0.3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
