import 'package:trpg_tool/core/models/skill.dart';

mixin SportSkills {
  List<Skill> allSkills = [];

  SkillType type = SkillType.sport;

  void init() {
    Skill climb = Skill()
      ..name = "攀爬"
      ..base = 20
      ..type = type;
    Skill jump = Skill()
      ..name = "跳跃"
      ..base = 20
      ..type = type;
    Skill swim = Skill()
      ..name = "游泳"
      ..base = 20
      ..type = type;
    final tempList = [climb, jump, swim];
    for (var s in tempList) {
      s.type = type;
    }
    allSkills.addAll(tempList);
  }
}
