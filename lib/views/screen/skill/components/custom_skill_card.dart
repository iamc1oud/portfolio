import 'dart:ui';

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
        color: Colors.white38.withOpacity(0.6),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
            width: 240,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 50, child: Image.asset("assets/skill_logo/kotlin.png")),
                Text(this.name, style: GoogleFonts.droidSansMono(fontSize: 20, fontWeight: FontWeight.bold)),
                Divider(),
                Text(
                  this.description,
                  style: GoogleFonts.roboto(fontSize: 16),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                )
              ],
            )),
      ),
    );
  }
}
