// technology 技术

import 'package:trpg_tool/core/models/skill.dart';

mixin TechnologySkills {
  List<Skill> allSkills = [];

  SkillType type = SkillType.technology;

  void init() {
    Skill disguise = Skill()
      ..name = "乔装"
      ..base = 5;
    Skill cleverHands = Skill()
      ..name = "妙手"
      ..base = 10;
    Skill locksmith = Skill()
      ..name = "锁匠"
      ..base = 1;
    Skill mechanicalMaintenance = Skill()
      ..name = "机械维修"
      ..base = 10;
    Skill electricalMaintenance = Skill()
      ..name = "电气维修"
      ..base = 10;
    Skill tamingAnimals = Skill()
      ..name = "驯兽"
      ..base = 5;
    Skill skill1 = Skill()
      ..name = "技艺"
      ..haveSub = true
      ..base = 5;
    Skill skill2 = Skill()
      ..name = "技艺"
      ..haveSub = true
      ..base = 5;
    Skill skill3 = Skill()
      ..name = "技艺"
      ..haveSub = true
      ..base = 5;
    Skill existence1 = Skill()
      ..name = "生存"
      ..haveSub = true
      ..base = 5;
    Skill existence2 = Skill()
      ..name = "生存"
      ..haveSub = true
      ..base = 5;
    Skill existence3 = Skill()
      ..name = "生存"
      ..haveSub = true
      ..base = 5;
    final tempList = [
      disguise,
      cleverHands,
      locksmith,
      mechanicalMaintenance,
      electricalMaintenance,
      tamingAnimals,
      skill1,
      skill2,
      skill3,
      existence1,
      existence2,
      existence3,
    ];
    for (var s in tempList) {
      s.type = type;
    }
    allSkills.addAll(tempList);
  }
}
