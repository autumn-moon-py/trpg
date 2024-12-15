import 'package:trpg_tool/core/models/skill.dart';

mixin CombatSkills {
  List<Skill> allSkills = [];

  SkillType type = SkillType.combat;

  int dex = 0;

  void init() {
    Skill dodge = Skill()
      ..name = "闪避"
      ..base = (dex / 2).floor();
    Skill aFistFight = Skill()
      ..name = "格斗"
      ..haveSub = true
      ..subName = "斗殴"
      ..base = 25;
    Skill otherFight1 = Skill()
      ..name = "格斗"
      ..haveSub = true;
    Skill otherFight2 = Skill()
      ..name = "格斗"
      ..haveSub = true;
    Skill pistolShooting = Skill()
      ..name = "射击"
      ..base = 20
      ..haveSub = true
      ..subName = "手枪";
    Skill otherShooting1 = Skill()
      ..name = "射击"
      ..haveSub = true;
    Skill otherShooting2 = Skill()
      ..name = "射击"
      ..haveSub = true;
    Skill throwSkill = Skill()
      ..name = "投掷"
      ..base = 20;
    final tempList = [
      dodge,
      aFistFight,
      otherFight1,
      otherFight2,
      pistolShooting,
      otherShooting1,
      otherShooting2,
      throwSkill
    ];
    for (var element in tempList) {
      element.type = type;
    }
    allSkills.addAll(tempList);
  }
}
