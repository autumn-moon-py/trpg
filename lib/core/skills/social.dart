import 'package:trpg_tool/core/models/skill.dart';

mixin SocialSkills {
  List<Skill> allSkills = [];

  SkillType type = SkillType.social;
  int edu = 0;
  Language nl = Language.none;

  void init() {
    Skill talk = Skill()
      ..name = "话术"
      ..base = 5;
    Skill social = Skill()
      ..name = "说服"
      ..base = 10;
    Skill charm = Skill()
      ..name = "取悦"
      ..base = 15;
    Skill fear = Skill()
      ..name = "恐吓"
      ..base = 15;
    Skill psycho = Skill()
      ..name = "心理学"
      ..base = 10;
    Skill nativeLanguage = Skill()
      ..name = "母语"
      ..haveSub = true
      ..subName = languageChineseMap[nl]!
      ..base = edu;
    Skill foreignLanguage1 = Skill()
      ..name = "外语"
      ..haveSub = true
      ..base = 1;
    Skill foreignLanguage2 = Skill()
      ..name = "外语"
      ..haveSub = true
      ..base = 1;
    final tempList = [
      talk,
      social,
      charm,
      fear,
      psycho,
      nativeLanguage,
      foreignLanguage1,
      foreignLanguage2
    ];
    for (var s in tempList) {
      s.type = type;
    }
    allSkills.addAll(tempList);
  }
}
