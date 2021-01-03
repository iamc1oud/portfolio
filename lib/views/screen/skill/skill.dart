import 'package:flutter/material.dart';
import 'package:myapp/views/screen/skill/skill_desktop.dart';
import 'package:myapp/views/screen/skill/skill_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Skill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: SkillDesktop(),
      mobile: SkillMobile(),
    );
  }
}
