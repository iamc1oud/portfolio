import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:myapp/views/screen/about/exports_about.dart';
import 'package:myapp/views/screen/skill/components/custom_skill_card.dart';

class SkillDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MY SKILLS",
              style: GoogleFonts.roboto(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              "I do all kind of neat stuff",
              style: GoogleFonts.roboto(
                fontSize: 20,
              ),
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.7,
              width: size.width * 0.8,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
                itemBuilder: (context, pos) {
                  return CustomSkillCard(
                    name: "Kotlin",
                    description: "Function programming language",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
