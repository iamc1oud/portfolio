import 'exports_about.dart';

class AboutDesktop extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutDesktop> {
  Color blackColorAccent = Color(0xff2C2F33);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: blackColorAccent,
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
                              GoogleFonts.robotoMono(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white),
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
                            color: Colors.white,
                          ),
                        ),
                        Divider(),
                        SocialLink(
                          url: "https://www.linkedin.com/in/ajay-kumar-singh-737182154/",
                          icon: Icon(
                            FontAwesome.linkedin_square,
                            color: Colors.white,
                          ),
                        ),
                        Divider(),
                        SocialLink(
                          icon: Icon(AntDesign.instagram, color: Colors.white),
                          url: "https://www.instagram.com/iamcloud.dev",
                        ),
                        Divider(),
                        SocialLink(
                          icon: Icon(AntDesign.github, color: Colors.white),
                          url: "https://www.github.com/AjjuSingh",
                        )
                      ],
                    ))),
          ],
        )
      ],
    );
  }
}
