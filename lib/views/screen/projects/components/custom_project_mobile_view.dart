import 'dart:ui';
import 'dart:js' as js;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:myapp/views/screen/about/exports_about.dart';

class CustomProjectMobileCard extends StatelessWidget {
  final Image image;
  final String title;
  final String gitHubLink;
  final String description;
  final String blurhash;
  final List<String> technologiesUsed;
  final List<String> appPreviews;

  const CustomProjectMobileCard(
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
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),

            /// TODO Add fade-in transition for the project name and its description.
            /// Convert stateless to stateful and use animation controllers
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: size.width * 0.9),
                      child: Text(this.title, style: GoogleFonts.robotoMono(fontSize: 30, color: Colors.white))),
                  //
                  // [Project Description]
                  //
                  Text(this.description, style: GoogleFonts.robotoMono(fontSize: 12, color: Colors.white)),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: size.height * 0.6,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: size.height * 0.1,
                          width: size.width * 0.4,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              RotateAnimatedTextKit(
                                  repeatForever: true,
                                  text: this.technologiesUsed,
                                  textStyle: GoogleFonts.roboto(fontSize: 20.0, color: Colors.black),
                                  textAlign: TextAlign.start),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            js.context.callMethod("open", [this.gitHubLink]);
                          },
                          child: Container(
                            height: size.height * 0.05,
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("GitHub", style: GoogleFonts.ubuntu(color: Colors.white)),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  FlutterIcons.github_with_circle_ent,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
