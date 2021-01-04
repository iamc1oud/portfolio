import 'package:flutter/material.dart';
import 'package:myapp/models/skill_model.dart';
import 'package:myapp/views/screen/about/exports_about.dart';

import 'custom_skill_card.dart';

class SkillSection extends StatelessWidget {
  final Skill skill;

  const SkillSection({Key key, this.skill}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            skill.skillName,
            style: GoogleFonts.droidSansMono(fontSize: 25),
          ),
          SizedBox(
            height: size.height * 0.2,
            width: size.width * 0.55,
            child: ListView.builder(
              cacheExtent: 1,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: skill.allLearnedSkills.length,
              itemBuilder: (context, pos) {
                return CustomSkillCard(
                  name: skill.allLearnedSkills[pos].name,
                  description: skill.allLearnedSkills[pos].description,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
