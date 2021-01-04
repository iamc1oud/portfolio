import 'package:flutter/material.dart';
import 'package:myapp/models/skill_model.dart';
import 'package:myapp/services/api/network_utils.dart';
import 'package:myapp/views/screen/about/exports_about.dart';
import 'package:myapp/views/screen/skill/components/skill_section.dart';

class SkillDesktop extends StatelessWidget {
  EdgePainter edgePainter = new EdgePainter();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await NetworkUtils().fetchSkills("query");
        },
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: CustomPaint(
              painter: edgePainter,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  "My Skills",
                  style: GoogleFonts.ubuntu(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "All stuff which I worked on!!!",
                  style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 60),
                FutureBuilder(
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case ConnectionState.done:
                        List<Skill> data = snapshot.data;
                        if (data == null) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Expanded(
                            child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, pos) {
                                  return SkillSection(
                                    skill: data[pos],
                                  );
                                }),
                          );
                        }
                        break;
                      case ConnectionState.none:
                        // TODO: Handle this case.
                        break;
                      case ConnectionState.active:
                        // TODO: Handle this case.
                        break;
                    }
                  },
                  future: NetworkUtils().fetchSkills(""),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width / 2, size.height * 0.2);
    path.lineTo(0, size.height * 0.4);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
