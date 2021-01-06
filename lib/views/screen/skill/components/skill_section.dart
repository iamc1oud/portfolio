import 'package:flutter/material.dart';
import 'package:myapp/models/skill_model.dart';
import 'package:myapp/utils/consts.dart';
import 'package:myapp/views/screen/about/exports_about.dart';
import 'package:myapp/views/screen/projects/common_widgets.dart';
import 'package:myapp/views/screen/skill/components/custom_skill_mobile_card.dart';

import 'custom_skill_card.dart';

class SkillSection extends StatelessWidget {
  final Skill skill;
  final DeviceType deviceType;

  const SkillSection({Key key, this.skill, this.deviceType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill.skillName,
            style: GoogleFonts.droidSansMono(fontSize: 20),
          ),
          SizedBox(
            height: size.height * 0.2,
            width: size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              //itemCount: skill.allLearnedSkills.length,
              children: skill.allLearnedSkills
                  .map((e) => deviceType == DeviceType.Desktop
                      ? CustomSkillCard(
                          name: e.name,
                          description: e.description,
                        )
                      : CustomSkillMobileCard(
                          name: e.name,
                          description: e.description,
                        ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
