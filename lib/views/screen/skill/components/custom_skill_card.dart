import 'package:flutter/material.dart';
import 'package:myapp/views/screen/about/exports_about.dart';

class CustomSkillCard extends StatelessWidget {
  final String name;
  final String assetImage;
  final String description;

  const CustomSkillCard({Key key, this.name, this.assetImage, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100, child: Image.asset("assets/skill_logo/kotlin.png")),
            Text(this.name, style: GoogleFonts.droidSansMono(fontSize: 30)),
            Text(this.description, style: GoogleFonts.roboto(fontSize: 15))
          ],
        )),
      ),
    );
  }
}
