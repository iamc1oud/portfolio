import 'dart:ui';
import 'dart:js' as js;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:myapp/views/screen/about/exports_about.dart';

class CustomProjectCard extends StatelessWidget {
  final Image image;
  final String title;
  final String gitHubLink;
  final String description;
  final String blurhash;
  final List<String> technologiesUsed;
  final List<String> appPreviews;

  const CustomProjectCard(
      {Key key,
      this.image,
      this.title,
      this.gitHubLink,
      this.technologiesUsed,
      this.description,
      this.blurhash,
      this.appPreviews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: this.image.image, fit: BoxFit.cover)),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 2),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),

              /// TODO Add fade-in transition for the project name and its description.
              /// Convert stateless to stateful and use animation controllers
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  // [Project Name]
                  //
                  Text(this.title, style: GoogleFonts.robotoMono(fontSize: 100, color: Colors.white)),
                  //
                  // [Project Description]
                  //
                  Text(this.description, style: GoogleFonts.robotoMono(fontSize: 30, color: Color(0xFFC4C4C4))),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        RotateAnimatedTextKit(
                            repeatForever: true,
                            text: this.technologiesUsed,
                            textStyle: GoogleFonts.roboto(fontSize: 30.0, color: Colors.white),
                            textAlign: TextAlign.start),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      js.context.callMethod("open", [this.gitHubLink]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("GitHub", style: GoogleFonts.ubuntu(fontSize: 40, color: Colors.white)),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            FlutterIcons.github_with_circle_ent,
                            color: Colors.white,
                            size: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: size.height * 0.8,
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.6,
                      aspectRatio: 1,
                      scrollDirection: Axis.horizontal),
                  items: this
                      .appPreviews
                      .map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(e),
                              fit: BoxFit.contain,
                            ),
                          ))
                      .toList(),
                ),
              )),
        ],
      ),
    );
  }
}
