import 'package:trpg_tool/core/models/skill.dart';

mixin ExploreSkills {
  List<Skill> allSkills = [];

  SkillType type = SkillType.explore;

  void init() {
    Skill scout = Skill()
      ..name = "侦察"
      ..base = 25;
    Skill listen = Skill()
      ..name = "聆听"
      ..base = 20;
    Skill library = Skill()
      ..name = "图书馆使用"
      ..base = 20;
    Skill computer = Skill()
      ..name = "计算机使用"
      ..base = 5;
    Skill stealth = Skill()
      ..name = "潜行"
      ..base = 20;
    Skill track = Skill()
      ..name = "追踪"
      ..base = 10;
    Skill navigation = Skill()
      ..name = "导航"
      ..base = 10;
    final tempList = [
      scout,
      listen,
      library,
      computer,
      stealth,
      track,
      navigation
    ];
    for (var element in tempList) {
      element.type = type;
    }
    allSkills.addAll(tempList);
  }
}
