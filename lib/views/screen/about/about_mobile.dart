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
            alignment: Alignment.topLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width * 0.8, minWidth: size.width * 0.3),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
}
