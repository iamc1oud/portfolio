import 'package:flutter/material.dart';
import 'package:myapp/views/screen/about/exports_about.dart';
import 'package:myapp/views/screen/projects/components/custom_project_view.dart';
import 'package:http/browser_client.dart';

class ProjectDesktop extends StatelessWidget {
  final PageController _projectSliderController = new PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _projectSliderController,
        scrollDirection: Axis.vertical,
        children: [
          CustomProjectCard(
              gitHubLink: "https://github.com/AjjuSingh/iRent-Flutter-App",
              technologiesUsed: ["Flutter", "Firebase", "MapBox"],
              appPreviews: [
                "https://raw.githubusercontent.com/AjjuSingh/iRent-Flutter-App/master/flutter_01.png",
                "https://raw.githubusercontent.com/AjjuSingh/iRent-Flutter-App/master/flutter_02.png" ""
              ],
              title: "iRent App",
              description: "Find a place to call home.",
              blurhash: "LGDcK[yD4m00~qR-RPM_%gWCIUV?",
              image: Image.network(
                  "https://www.pexels.com/photo/1034662/download/?search_query=&tracking_id=8j1zdfqiyn3")),
          CustomProjectCard(
              gitHubLink: "https://github.com/AjjuSingh/iRent-Flutter-App",
              technologiesUsed: ["Flutter", "Firebase", "MapBox"],
              appPreviews: [
                "https://raw.githubusercontent.com/AjjuSingh/iRent-Flutter-App/master/flutter_01.png",
                "https://raw.githubusercontent.com/AjjuSingh/iRent-Flutter-App/master/flutter_02.png" ""
              ],
              title: "iRent App",
              description: "Find a place to call home.",
              blurhash: "LGDcK[yD4m00~qR-RPM_%gWCIUV?",
              image:
                  Image.network("https://www.pexels.com/photo/1034662/download/?search_query=&tracking_id=8j1zdfqiyn3"))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BrowserClient client = new BrowserClient();
          client
              .get("http://localhost:8080/project", headers: {
                "Accept": "application/json",
                "Access-Control-Allow-Origin": "localhost:8080",
              })
              .then((value) => print(value.body))
              .catchError((e) => print(e));
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
