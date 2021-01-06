import 'exports_about.dart';
import 'dart:js' as js;

class AboutDesktop extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutDesktop> {
  EdgePainter edgePainter = new EdgePainter();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: size.width * 0.2),
            child: downloadResumeButton(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: size.width * 0.7, minWidth: size.width * 0.3),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TypewriterAnimatedTextKit(
                          isRepeatingAnimation: false,
                          repeatForever: false,
                          onFinished: () {},
                          speed: Duration(milliseconds: 200),
                          text: ["Hi,\nI'm Ajay\nFlutter Developer"],
                          textStyle:
                              GoogleFonts.robotoMono(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )),
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialLink(
                          url: "https://www.facebook.com/black.birdcoder",
                          icon: Icon(
                            FontAwesome.facebook_square,
                            color: ColorTheme().iconTheme,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SocialLink(
                          url: "https://www.linkedin.com/in/ajay-kumar-singh-737182154/",
                          icon: Icon(
                            FontAwesome.linkedin_square,
                            color: ColorTheme().iconTheme,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SocialLink(
                          icon: Icon(
                            AntDesign.instagram,
                            color: ColorTheme().iconTheme,
                          ),
                          url: "https://www.instagram.com/iamcloud.dev",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SocialLink(
                          icon: Icon(
                            AntDesign.github,
                            color: ColorTheme().iconTheme,
                          ),
                          url: "https://www.github.com/AjjuSingh",
                        )
                      ],
                    ))),
          ],
        )
      ],
    );
  }

  Widget downloadResumeButton() {
    return Container(
      height: 80,
      child: RaisedButton(
        color: Colors.pink[500],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: Text("Download CV", style: GoogleFonts.raleway(color: Colors.white, fontSize: 40)),
        ),
        onPressed: () {
          js.context.callMethod("open", [
            "https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a3948a13-8e51-4220-8f59-20673bd63f78/Ajays_Resume_Latest.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210106T140554Z&X-Amz-Expires=86400&X-Amz-Signature=5e7a531a4a67f244465e8cc90b56e402338e0f315a2d565a14ce28cebe90e4b2&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Ajay%27s%2520Resume%2520Latest.pdf%22"
          ]);
          print("Show dialog and submit form");
        },
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
        Colors.blue[900],
        Colors.blue[500],
      ],
    ).createShader(rect);
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width / 2, size.height * 0.95);
    path.lineTo(0, size.height * 0.8);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
