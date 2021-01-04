class Skill {
  int id;
  String skillName;
  List<AllLearnedSkills> allLearnedSkills;

  Skill({this.id, this.skillName, this.allLearnedSkills});

  Skill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skillName = json['skillName'];
    if (json['allLearnedSkills'] != null) {
      allLearnedSkills = new List<AllLearnedSkills>.empty(growable: true);
      json['allLearnedSkills'].forEach((v) {
        allLearnedSkills.add(new AllLearnedSkills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['skillName'] = this.skillName;
    if (this.allLearnedSkills != null) {
      data['allLearnedSkills'] = this.allLearnedSkills.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllLearnedSkills {
  String imgSrc;
  String name;
  String description;

  AllLearnedSkills({this.imgSrc, this.name, this.description});

  AllLearnedSkills.fromJson(Map<String, dynamic> json) {
    imgSrc = json['imgSrc'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgSrc'] = this.imgSrc;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
