import 'dart:js';

import 'package:myapp/views/screen/about/about_desktop.dart';

import 'exports_about.dart';

class AboutMobile extends StatelessWidget {
  Color blackColorAccent = Color(0xff2C2F33);
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
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width * 0.8, minWidth: size.width * 0.3),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TypewriterAnimatedTextKit(
                      repeatForever: false,
                      isRepeatingAnimation: false,
                      onFinished: () {
                        print("go to projects section");
                      },
                      speed: Duration(milliseconds: 100),
                      text: ["Hi,\nI'm Ajay\nFlutter Developer"],
                      textAlign: TextAlign.left,
                      textStyle: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white, height: 1.6),
                    ),
                    downloadResumeButton()
                  ],
                ),
              ),
            )),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SocialLink(
                    url: "https://www.facebook.com/black.birdcoder",
                    icon: Icon(
                      FontAwesome.facebook_square,
                      color: ColorTheme().iconTheme,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SocialLink(
                    url: "https://www.linkedin.com/in/ajay-kumar-singh-737182154/",
                    icon: Icon(
                      FontAwesome.linkedin_square,
                      color: ColorTheme().iconTheme,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SocialLink(
                    icon: Icon(
                      AntDesign.instagram,
                      color: ColorTheme().iconTheme,
                    ),
                    url: "https://www.instagram.com/iamcloud.dev",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SocialLink(
                    icon: Icon(
                      AntDesign.github,
                      color: ColorTheme().iconTheme,
                    ),
                    url: "https://www.github.com/AjjuSingh",
                  )
                ],
              ),
            ))
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
          child: Text("Download CV", style: GoogleFonts.raleway(color: Colors.white, fontSize: 20)),
        ),
        onPressed: () {
          context.callMethod("open", [
            "https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a3948a13-8e51-4220-8f59-20673bd63f78/Ajays_Resume_Latest.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210106T140554Z&X-Amz-Expires=86400&X-Amz-Signature=5e7a531a4a67f244465e8cc90b56e402338e0f315a2d565a14ce28cebe90e4b2&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Ajay%27s%2520Resume%2520Latest.pdf%22"
          ]);
          print("Show dialog and submit form");
        },
      ),
    );
  }
}
