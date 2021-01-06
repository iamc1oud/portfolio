import 'package:flutter/material.dart';
import 'package:myapp/models/skill_model.dart';
import 'package:myapp/services/api/network_utils.dart';
import 'package:myapp/utils/consts.dart';
import 'package:myapp/views/screen/skill/components/skill_section.dart';

class CommonSkillWidgets {
  Widget buildSkillWidget([DeviceType deviceType, Size size]) {
    return FutureBuilder(
        future: NetworkUtils().fetchSkills(""),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              List<Skill> data = snapshot.data;
              if (data == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, pos) {
                        return SkillSection(
                          skill: data[pos],
                          deviceType: DeviceType.Mobile,
                        );
                      }),
                );
              }
              break;
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
          }
        });
  }
}
