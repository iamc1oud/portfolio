import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:myapp/screen/about/export_about.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '! 👑 Cloud ⚡ SONIQS !',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = new PageController(initialPage: 0);
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageViewController,
          scrollDirection: Axis.horizontal,
          children: [AboutPage(), Text("Projects")],
        ),
        resizeToAvoidBottomPadding: false,
        floatingActionButton: FloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          activeIndex: activeIndex,
          backgroundColor: Color(0xFF23272B),
          elevation: 5,
          inactiveColor: Colors.white,
          rightCornerRadius: 1,
          gapLocation: GapLocation.center,
          onTap: (int currentPosition) {
            setState(() {
              activeIndex = currentPosition;
            });
          },
          icons: [
            AntDesign.profile,
            FlutterIcons.project_diagram_faw5s,
          ],
        ));
  }
}
