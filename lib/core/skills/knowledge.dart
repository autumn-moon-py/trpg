import 'package:trpg_tool/core/models/skill.dart';

mixin KnowledgeSkills {
  List<Skill> allSkills = [];

  SkillType type = SkillType.knowledge;

  void init() {
    Skill botanical = Skill()
      ..name = "博物学"
      ..base = 10;
    Skill mystery = Skill()
      ..name = "神秘学"
      ..base = 5;
    Skill archeology = Skill()
      ..name = "考古学"
      ..base = 1;
    Skill human = Skill()
      ..name = "人类学"
      ..base = 1;
    Skill valuate = Skill()
      ..name = "估价"
      ..base = 5;
    Skill accounting = Skill()
      ..name = "会计"
      ..base = 5;
    Skill law = Skill()
      ..name = "法律"
      ..base = 5;
    Skill history = Skill()
      ..name = "历史"
      ..base = 5;
    Skill electronics = Skill()
      ..name = "电子学Ω"
      ..base = 1;
    Skill science1 = Skill()
      ..name = "科学"
      ..base = 1
      ..haveSub = true;
    Skill science2 = Skill()
      ..name = "科学"
      ..base = 1
      ..haveSub = true;
    Skill science3 = Skill()
      ..name = "科学"
      ..base = 1
      ..haveSub = true;
    final tempList = [
      botanical,
      mystery,
      archeology,
      human,
      valuate,
      accounting,
      law,
      history,
      electronics,
      science1,
      science2,
      science3
    ];
    for (var element in tempList) {
      element.type = type;
    }
    allSkills.addAll(tempList);
  }
}
