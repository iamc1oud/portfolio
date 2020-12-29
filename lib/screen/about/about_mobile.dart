import 'exports_about.dart';

class AboutMobile extends StatelessWidget {
  Color blackColorAccent = Color(0xFFDD5144);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: blackColorAccent,
        ),
        Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width * 0.5, minWidth: size.width * 0.3),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TypewriterAnimatedTextKit(
                      repeatForever: false,
                      isRepeatingAnimation: false,
                      onFinished: () {
                        print("go to projects section");
                      },
                      speed: Duration(milliseconds: 100),
                      text: ["Hi", "I'm Ajay", "Flutter Developer"],
                      textAlign: TextAlign.center,
                      textStyle:
                          GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, height: 2),
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
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SocialLink(
                    url: "https://www.linkedin.com/in/ajay-kumar-singh-737182154/",
                    icon: Icon(
                      FontAwesome.linkedin_square,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SocialLink(
                    icon: Icon(AntDesign.instagram, color: Colors.white),
                    url: "https://www.instagram.com/iamcloud.dev",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SocialLink(
                    icon: Icon(AntDesign.github, color: Colors.white),
                    url: "https://www.github.com/AjjuSingh",
                  )
                ],
              ),
            ))
      ],
    );
  }
}
